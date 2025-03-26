import 'package:freezed_annotation/freezed_annotation.dart';

part 'convert_url_request.freezed.dart';
part 'convert_url_request.g.dart';

@freezed
abstract class ConvertUrlRequest with _$ConvertUrlRequest {
  const factory ConvertUrlRequest({required String url}) = _ConvertUrlRequest;

  factory ConvertUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$ConvertUrlRequestFromJson(json);
}
