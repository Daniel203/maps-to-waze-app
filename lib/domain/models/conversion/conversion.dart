import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maps_to_waze/data/services/api/models/convert_url_response/convert_url_response.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion_entity.dart';
import 'package:maps_to_waze/domain/models/coordinates/coordinates.dart';

part 'conversion.freezed.dart';
part 'conversion.g.dart';

@freezed
abstract class Conversion with _$Conversion {
  const factory Conversion({
    required Uri url,
    required Coordinates coordinates,
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
    return Conversion(url: url, coordinates: coordinates);
  }

  factory Conversion.fromResponse(ConvertUrlResponse response) {
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
