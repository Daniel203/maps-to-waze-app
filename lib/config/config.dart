import 'package:logging/logging.dart';

class Config {}

class ConfigProd extends Config {
  static const String backendHost =
      "https://maps-to-waze-api-177185679491.europe-west8.run.app";
  static const int backendPort = 443;
  static const Level loggerLevel = Level.INFO;
}

class ConfigDev extends Config {
  // Use this if running in android emulator
  // static const String backendHost = "http://10.0.2.2";
  // Use this if running in docker, run the following command in docker 
  // `adb reverse tcp:8080 tcp:8080`
  static const String backendHost = "http://127.0.0.1";
  static const int backendPort = 8080;
  static const Level loggerLevel = Level.ALL;
}
