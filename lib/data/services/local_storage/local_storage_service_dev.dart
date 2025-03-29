import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:maps_to_waze/data/services/local_storage/hive_boxes.dart';
import 'package:maps_to_waze/data/services/local_storage/local_storage_service.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion_entity.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

class LocalStorageServiceDev implements LocalStorageService {
  Future<Box<T>> _openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  @override
  Future<Result> saveConversion(Conversion data) async {
    try {
      final box = await _openBox<ConversionEntity>(historyBoxName);

      final localUrlData = ConversionEntity(
        url: data.url.toString(),
        latitude: data.coordinates.latitude.toString(),
        longitude: data.coordinates.longitude.toString(),
      );
      await box.add(localUrlData);

      return Success("");
    } on Exception catch (error) {
      return Failure(error);
    }
  }

  @override
  Future<Result<List<ConversionEntity>>> getConversionHistory() async {
    try {
      final box = await _openBox<ConversionEntity>(historyBoxName);
      final List<ConversionEntity> conversions = box.values.toList();

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
