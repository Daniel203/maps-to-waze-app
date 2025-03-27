import 'package:flutter/widgets.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/config/config.dart';
import 'package:maps_to_waze/config/dependencies.dart';
import 'package:maps_to_waze/hive/hive_registrar.g.dart';
import 'package:maps_to_waze/main.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();
  Hive.registerAdapters();

  Logger.root.level = ConfigProd.loggerLevel;

  runApp(MultiProvider(providers: providersProd, child: const MainApp()));
}
