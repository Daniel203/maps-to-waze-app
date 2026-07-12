import 'dart:async';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/core/themes/theme.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'main_dev.dart' as development;

Future<void> main() async {
  await development.main();
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final GoRouter _goRouter = router();
  StreamSubscription? _sharingSubscription;

  @override
  void initState() {
    super.initState();

    ReceiveSharingIntent.instance.getInitialMedia().then((sharedUrls) {
      if (sharedUrls.isNotEmpty) {
        var url = sharedUrls.first.path;
        _goRouter.go(Routes.convertUrl(url));
        ReceiveSharingIntent.instance.reset();
      }
    });

    _sharingSubscription =
        ReceiveSharingIntent.instance.getMediaStream().listen((sharedUrls) {
      if (sharedUrls.isNotEmpty) {
        var url = sharedUrls.first.path;
        _goRouter.go(Routes.convertUrl(url));
        ReceiveSharingIntent.instance.reset();
      }
    });
  }

  @override
  void dispose() {
    _sharingSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MaterialTheme theme = MaterialTheme(TextTheme());

    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp.router(
          theme: ThemeData(
            colorScheme: lightColorScheme ?? theme.light().colorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? theme.dark().colorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system,
          routerConfig: _goRouter,
        );
      },
    );
  }
}
