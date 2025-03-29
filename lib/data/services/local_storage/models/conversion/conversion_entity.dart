import 'package:hive_ce/hive.dart';

class ConversionEntity extends HiveObject {
  String url;
  String longitude;
  String latitude;

  ConversionEntity({
    required this.url,
    required this.longitude,
    required this.latitude,
  });
}
