import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion.dart';
import 'package:maps_to_waze/domain/models/url_data/url_data.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class LocalStorageService {
  Future<Result> saveConversion(UrlData data);
  Future<Result<List<Conversion>>> getConversionHistory();
  Future<Result> clearConversionHistory();
}
