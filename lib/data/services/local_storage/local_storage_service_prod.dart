import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:maps_to_waze/data/services/local_storage/hive_boxes.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion.dart';
import 'package:maps_to_waze/domain/models/url_data/url_data.dart';
import 'package:result_dart/result_dart.dart';

class LocalStorageServiceProd implements LocalStorageService {
  Future<Box<T>> _openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  @override
  Future<Result> saveConversion(UrlData data) async {
    try {
      final box = await _openBox<Conversion>(historyBoxName);
        
      final localUrlData = Conversion(
        url: data.url.toString(),
        latitude: data.coordinates.latitude,
        longitude: data.coordinates.longitude,
      );
      await box.add(localUrlData);

      return Success("");
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  @override
  Future<Result<List<Conversion>>> getConversionHistory() async {
    try {
      final box = await _openBox<Conversion>(historyBoxName);
      final List<Conversion> conversions = box.values.toList();
      return Success(conversions);
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  @override
  Future<Result> clearConversionHistory() async {
    try {
      final box = await _openBox<Conversion>(historyBoxName);
      await box.clear();
      return Success("");
    } on Exception catch (error) {
      return Failure(error);
    }
  }
}
