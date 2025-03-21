import 'package:freezed_annotation/freezed_annotation.dart';

part 'url_conversion_api_model.freezed.dart';
part 'url_conversion_api_model.g.dart';

@freezed
abstract class UrlConversionApiModel with _$UrlConversionApiModel {
  const factory UrlConversionApiModel({required String url}) = _UrlConversionApiModel;

  factory UrlConversionApiModel.fromJson(Map<String, dynamic> json) =>
      _$UrlConversionApiModelFromJson(json);
}
