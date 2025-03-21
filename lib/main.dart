import 'package:flutter/material.dart';
import 'package:maps_to_waze/routing/router.dart';
import 'main_prod.dart' as production;

void main() {
  // Run development environment by default
  production.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router());
  }
}
