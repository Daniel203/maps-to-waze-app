import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/config/dependencies.dart';
import 'package:maps_to_waze/routing/router.dart';
import 'package:provider/provider.dart';

void main() {
  Logger.root.level = Level.ALL;
  runApp(MultiProvider(providers: providers, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router(),);
  }
}
