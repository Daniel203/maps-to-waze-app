import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:maps_to_waze/data/repositories/url_conversion/url_conversion_respository.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:result_dart/result_dart.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends ChangeNotifier {
  final UrlConversionRepository _urlConversionRepository;
  final _log = Logger('HomeViewModel');

  late Command load;

  HomeViewModel({required UrlConversionRepository urlConversionRepository})
    : _urlConversionRepository = urlConversionRepository {
    load = Command.createAsyncNoParam(_load, initialValue: null);
    load.execute();
  }

  Future<Result> _load() async {
    SharedMediaFile? sharedUrl;
    List<SharedMediaFile> sharedUrls;

    try {
      sharedUrls = await ReceiveSharingIntent.instance.getInitialMedia();
      if (sharedUrls.isNotEmpty) {
        sharedUrl = sharedUrls.first;
      }

      sharedUrls = await ReceiveSharingIntent.instance.getMediaStream().first;
      if (sharedUrls.isNotEmpty) {
        sharedUrl = sharedUrls.first;
      }

      if (sharedUrl == null) {
        _log.warning("No shared link found");
        return Failure(Exception("No shared link found"));
      }

      var result = await _getConvertedUrl(sharedUrl.path);
      result.fold(
        (uri) async {
          _log.info("Converted url: $uri");
          if (!await launchUrl(uri)) {
            _log.warning("Failed to launch url: $uri");
            return Failure(Exception("Failed to launch url"));
          }
        },
        (failure) {
          _log.warning("Failed to convert url: $failure");
          return Failure(failure);
        },
      );
    } on Exception catch (e) {
      _log.warning("Error during media sharing process: $e");
      return Failure(Exception("Error during media sharing process"));
    } finally {
      ReceiveSharingIntent.instance.reset();
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
