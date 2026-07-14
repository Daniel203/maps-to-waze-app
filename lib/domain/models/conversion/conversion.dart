import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maps_to_waze/data/services/api/models/convert_url_response/convert_url_response.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion_entity.dart';
import 'package:maps_to_waze/domain/models/coordinates/coordinates.dart';
import 'dart:typed_data';

part 'conversion.freezed.dart';
part 'conversion.g.dart';

@freezed
abstract class Conversion with _$Conversion {
  const factory Conversion({
    required Uri url,
    required Coordinates coordinates,
    String? mapImagePath,
    String? addressLine1,
    String? addressLine2,
    String? formattedAddress,
    @Default(0) int enrichmentAttempts,
    @Default(false) bool isFavorite,
  }) = _Conversion;

  factory Conversion.fromJson(Map<String, dynamic> json) =>
      _$ConversionFromJson(json);

  factory Conversion.fromEntity(ConversionEntity conversionEntity) {
    var url = Uri.tryParse(conversionEntity.url);
    var latitude = double.tryParse(conversionEntity.latitude);
    var longitude = double.tryParse(conversionEntity.longitude);

    if (url == null || latitude == null || longitude == null) {
      throw FormatException('Invalid conversion entity');
    }

    final coordinates = Coordinates(latitude: latitude, longitude: longitude);
    return Conversion(
      url: url,
      coordinates: coordinates,
      mapImagePath: conversionEntity.mapImagePath,
      addressLine1: conversionEntity.addressLine1,
      addressLine2: conversionEntity.addressLine2,
      formattedAddress: conversionEntity.formattedAddress,
      enrichmentAttempts: conversionEntity.enrichmentAttempts,
      isFavorite: conversionEntity.isFavorite,
    );
  }

  factory Conversion.fromConvertUrlResponse(ConvertUrlResponse response) {
    var url = Uri.tryParse(response.url);
    var latitude = double.tryParse(response.coordinates.latitude);
    var longitude = double.tryParse(response.coordinates.longitude);

    if (url == null || latitude == null || longitude == null) {
      throw FormatException('Invalid conversion entity');
    }

    final coordinates = Coordinates(latitude: latitude, longitude: longitude);
    return Conversion(url: url, coordinates: coordinates);
  }
}

class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List<int>? json) {
    if (json == null) {
      return null;
    }
    return Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    if (object == null) {
      return null;
    }
    return object.toList();
  }
}
