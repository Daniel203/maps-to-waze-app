import 'package:hive_ce/hive.dart';

class ConversionEntity extends HiveObject {
  String url;
  String longitude;
  String latitude;
  String? mapImagePath;
  String? addressLine1;
  String? addressLine2;
  String? formattedAddress;
  int enrichmentAttempts;
  bool isFavorite;

  ConversionEntity({
    required this.url,
    required this.longitude,
    required this.latitude,
    required this.mapImagePath,
    required this.addressLine1,
    required this.addressLine2,
    required this.formattedAddress,
    this.enrichmentAttempts = 0,
    this.isFavorite = false,
  });
}
