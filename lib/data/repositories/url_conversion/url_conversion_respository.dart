import 'package:result_dart/result_dart.dart';

abstract class UrlConversionRepository {
  Future<Result<Uri>> convertUrl(String url);
}
