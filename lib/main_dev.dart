import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/config/config.dart';
import 'package:maps_to_waze/config/dependencies.dart';
import 'package:maps_to_waze/main.dart';
import 'package:provider/provider.dart';

void main() {
  Logger.root.level = ConfigDev.loggerLevel;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  runApp(MultiProvider(providers: providersDev, child: const MainApp()));
}
