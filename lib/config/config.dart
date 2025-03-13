import 'package:logging/logging.dart';

class Config {}

class ConfigProd extends Config {
  static const String backendHost =
      "https://maps-to-waze-api-177185679491.europe-west8.run.app";
  static const int backendPort =
      8080;
  static const Level loggerLevel = Level.INFO;
}

class ConfigDev extends Config {
  static const String backendHost = "localhost";
  static const int backendPort = 8080;
  static const Level loggerLevel = Level.ALL;
}
