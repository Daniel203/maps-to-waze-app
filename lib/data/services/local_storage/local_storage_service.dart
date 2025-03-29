import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion_entity.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class LocalStorageService {
  Future<Result> saveConversion(Conversion data);
  Future<Result<List<ConversionEntity>>> getConversionHistory();
  Future<Result> clearConversionHistory();
}
