import 'package:hive_ce/hive.dart';

class Conversion extends HiveObject {
  String url;
  String longitude;
  String latitude;

  Conversion({
    required this.url,
    required this.longitude,
    required this.latitude,
  });
}
