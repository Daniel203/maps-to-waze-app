import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maps_to_waze/routing/router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'main_dev.dart' as development;

void main() {
  // Run development environment by default
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = router();

    // Receive links when the app is closed
    ReceiveSharingIntent.instance.getInitialMedia().then((sharedUrls) {
      if (sharedUrls.isNotEmpty) {
        var sharedUrl = sharedUrls.first.path;
        var base64EncodedUrl = base64Url.encode(
          utf8.encode(sharedUrl.toString()),
        );
        goRouter.go(Routes.convertUrl(base64EncodedUrl));
      }
    });

    // Receive links when the app is already open
    ReceiveSharingIntent.instance.getMediaStream().listen((sharedUrls) {
      if (sharedUrls.isNotEmpty) {
        var sharedUrl = sharedUrls.first.path;
        var base64EncodedUrl = base64Url.encode(
          utf8.encode(sharedUrl.toString()),
        );
        goRouter.go(Routes.convertUrl(base64EncodedUrl));
        ReceiveSharingIntent.instance.reset();
      }
    });

    return MaterialApp.router(routerConfig: goRouter);
  }
}
