import 'dart:io';
import 'dart:typed_data';

import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/services/local_storage/hive_boxes.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion_entity.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:path_provider/path_provider.dart';
import 'package:result_dart/result_dart.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class LocalStorageService {
  final _log = Logger("LocalStorageService");

  Future<Box<T>> _openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  bool _checkFileExists(File file) {
    try {
      return file.existsSync();
    } catch (e) {
      _log.warning("Error checking file existence: $e");
      return false;
    }
  }

  Future<Result> saveConversion(Conversion data) async {
    _log.info("Saving conversion data to local storage");
    try {
      final box = await _openBox<ConversionEntity>(historyBoxName);

      final localUrlData = ConversionEntity(
        url: data.url.toString(),
        latitude: data.coordinates.latitude.toString(),
        longitude: data.coordinates.longitude.toString(),
        mapImagePath: data.mapImagePath,
        addressLine1: data.addressLine1,
        addressLine2: data.addressLine2,
        formattedAddress: data.formattedAddress,
      );
      await box.add(localUrlData);

      _log.info("Conversion data saved successfully");
      return Success("");
    } on Exception catch (error) {
      _log.warning("Failed to save conversion data: $error");
      return Failure(error);
    }
  }

  Future<Result> updateConversion(Conversion data) async {
    _log.info("Updating conversion data in local storage");
    try {
      final box = await _openBox<ConversionEntity>(historyBoxName);
      final entity = box.values.firstWhere(
        (c) =>
            c.url == data.url.toString() &&
            c.latitude == data.coordinates.latitude.toString() &&
            c.longitude == data.coordinates.longitude.toString(),
      );

      entity.mapImagePath = data.mapImagePath;
      entity.addressLine1 = data.addressLine1;
      entity.addressLine2 = data.addressLine2;
      entity.formattedAddress = data.formattedAddress;
      entity.enrichmentAttempts = data.enrichmentAttempts;
      await entity.save();

      _log.info("Conversion data updated successfully");
      return Success("");
    } on Exception catch (error) {
      _log.warning("Failed to update conversion data: $error");
      return Failure(error);
    }
  }

  Future<Result<List<ConversionEntity>>> getConversionHistory() async {
    _log.info("Fetching conversion history from local storage");
    try {
      final box = await _openBox<ConversionEntity>(historyBoxName);
      final List<ConversionEntity> conversions = box.values.toList();

      _log.info(
        "Fetched conversion history successfully, count: ${conversions.length}",
      );
      return Success(conversions);
    } on Exception catch (error) {
      _log.warning("Failed to fetch conversion history: $error");
      return Failure(error);
    }
  }

  Future<Result> clearConversionHistory() async {
    _log.info("Clearing conversion history from local storage");
    try {
      final box = await _openBox<ConversionEntity>(historyBoxName);
      await box.clear();
      _log.info("Conversion history cleared successfully");
      return Success("");
    } on Exception catch (error) {
      _log.warning("Failed to clear conversion history: $error");
      return Failure(error);
    }
  }

  Future<Result> deleteConversion(Conversion conversion) async {
    try {
      _log.info("Deleting conversion from local storage");
      final box = await _openBox<ConversionEntity>(historyBoxName);
      final List<ConversionEntity> conversions = box.values.toList();
      final conversionToDelete = conversions.firstWhere(
        (c) =>
            c.url == conversion.url.toString() &&
            c.latitude == conversion.coordinates.latitude.toString() &&
            c.longitude == conversion.coordinates.longitude.toString(),
      );

      await conversionToDelete.delete();
      _log.info("Conversion deleted successfully");
      return Success("");
    } on Exception catch (error) {
      _log.warning("Failed to delete conversion: $error");
      return Failure(error);
    }
  }

  Future<Result<String>> saveImageToDisk(Uint8List imageData) async {
    try {
      _log.info("Saving image to disk");
      final directory = await getApplicationDocumentsDirectory();
      final fileName = "${Uuid().v4()}jpg";
      final filePath = join(directory.path, fileName);
      final file = File(filePath);
      await file.writeAsBytes(imageData);

      if (!_checkFileExists(file)) {
        _log.warning("File does not exist after writing: ${file.path}");
        throw Exception("File does not exist after writing");
      }

      _log.info("Image saved to disk successfully, path: ${file.path}");
      return Success(file.path);
    } on Exception catch (error) {
      _log.warning("Failed to save image to disk: $error");
      return Failure(error);
    }
  }

  Future<Result<List<ConversionEntity>>> searchConversions(String query) async {
    _log.info("Searching conversion for query: $query");
    try {
      final box = await _openBox<ConversionEntity>(historyBoxName);

      if (query.isEmpty) {
        _log.info("Query is empty, returning all conversions");
        return await getConversionHistory();
      }

      query = query.toLowerCase();

      List<ConversionEntity> filteredConversions =
          box.values
              .where(
                (c) =>
                    (c.addressLine1?.toLowerCase().contains(query) ?? false) ||
                    (c.addressLine2?.toLowerCase().contains(query) ?? false) ||
                    (c.formattedAddress?.toLowerCase().contains(query) ?? false),
              )
              .toList();

      _log.info("Found ${filteredConversions.length} elements");
      return Success(filteredConversions);
    } on Exception catch (error) {
      _log.warning("Failed to search conversions: $error");
      return Failure(error);
    }
  }
}
