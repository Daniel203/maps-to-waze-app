import 'package:flutter/material.dart';
import 'package:maps_to_waze/routing/router.dart';
import 'main_dev.dart' as development;

void main() {
  // Run development environment by default
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router());
  }
}
