import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:maps_to_waze/routing/router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:result_dart/result_dart.dart';
import 'package:url_launcher/url_launcher.dart';

class MainViewModel extends ChangeNotifier {
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('MainViewModel');

  late Command convertUrlAndRedirect;

  MainViewModel({required UrlConversionRepository urlConversionRepository})
    : _urlConversionRepository = urlConversionRepository {
    convertUrlAndRedirect = Command.createAsync<String, void>(
      _convertUrlAndRedirect,
      initialValue: null,
    );

    receiveSharingContent();
  }

  void receiveSharingContent() {
    // Receive links when the app is closed
    ReceiveSharingIntent.instance.getInitialMedia().then((sharedUrls) {
      if (sharedUrls.isNotEmpty) {
        var sharedUrl = sharedUrls.first;
        convertUrlAndRedirect.execute(sharedUrl.path);
      }
    });

    // Receive links when the app is already open
    ReceiveSharingIntent.instance.getMediaStream().listen((sharedUrls) {
      if (sharedUrls.isNotEmpty) {
        var sharedUrl = sharedUrls.first;
        convertUrlAndRedirect.execute(sharedUrl.path);
      }
    });

    ReceiveSharingIntent.instance.reset();
  }

  Future<Result<void>> _convertUrlAndRedirect(String url) async {
    notifyListeners();
    final context = rootNavigatorKey.currentContext;
    if (context == null) {
      return Failure(Exception("Context not found"));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(Routes.main);
    });

    if (url.isEmpty) {
      return Failure(Exception("Url not found"));
    }

    try {
      var result = await _getConvertedUrl(url);

      // First return to the home page to make sure the user is not stucked in a empty page
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(Routes.home);
      });

      var uri = result.getOrThrow();

      var success = await launchUrl(uri);
      if (success) {
        return Failure(Exception("Failed to launch url"));
      }
    } on Exception catch (e) {
      _log.warning("Error during url conversion process: $e");
      return Failure(Exception("Error during url conversion process"));
    } finally {
      notifyListeners();
    }

    return Success("");
  }

  Future<Result<Uri>> _getConvertedUrl(String url) async {
    if (url.isEmpty) {
      return Failure(Exception("Url not found"));
    }

    return await _urlConversionRepository.convertUrl(url);
  }
}
