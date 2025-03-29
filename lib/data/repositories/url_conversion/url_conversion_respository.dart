import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class UrlConversionRepository {
  Future<Result<Conversion>> convertUrl(String url);
  Future<Result<List<Conversion>>> getConversionHistory();
}
