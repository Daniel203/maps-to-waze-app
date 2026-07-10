import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:maps_to_waze/routing/router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/core/themes/theme.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'main_dev.dart' as development;

Future<void> main() async {
  // Run development environment by default
  await development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = router();

    // Receive links when the app is closed
    ReceiveSharingIntent.instance.getInitialMedia().then((sharedUrls) {
      if (sharedUrls.isNotEmpty) {
        var url = sharedUrls.first.path;
        goRouter.go(Routes.convertUrl(url));
      }
    });

    // Receive links when the app is already open
    ReceiveSharingIntent.instance.getMediaStream().listen((sharedUrls) {
      if (sharedUrls.isNotEmpty) {
        var url = sharedUrls.first.path;
        goRouter.go(Routes.convertUrl(url));
        ReceiveSharingIntent.instance.reset();
      }
    });

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
          routerConfig: goRouter,
        );
      },
    );
  }
}
