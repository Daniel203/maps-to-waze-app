import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:logging/logging.dart';
import 'package:result_dart/result_dart.dart';

class HomeViewModel extends ChangeNotifier {
  final _log = Logger('HomeViewModel');

  late Command urlChangedCommand;
  late Command submitUrlCommand;
  late Command pasteFromClipboard;

  final TextEditingController _urlTextController = TextEditingController();
  String? _pendingUrl;

  HomeViewModel() {
    urlChangedCommand = Command.createSyncNoResult<String>(_urlChanged);
    submitUrlCommand = Command.createAsyncNoParam<Result<String>?>(
      _submitUrl,
      initialValue: null,
    );
    pasteFromClipboard = Command.createAsyncNoParamNoResult(
      _pasteFromClipboard,
    );
  }

  TextEditingController get urlTextController => _urlTextController;

  String? consumePendingUrl() {
    final url = _pendingUrl;
    _pendingUrl = null;
    return url;
  }

  void _urlChanged(String url) {
    if (urlTextController.text != url) {
      urlTextController.text = url;
    }

    notifyListeners();
  }

  bool get valid {
    if (urlTextController.text.isEmpty) {
      return false;
    }

    try {
      Uri uri = Uri.parse(urlTextController.text);
      if (!uri.hasAbsolutePath) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  Future<Result<String>?> _submitUrl() async {
    if (!valid) {
      _log.warning("Invalid url: ${urlTextController.text}");
      return Failure(Exception("Invalid url"));
    }

    _log.info("Submitted url");
    _pendingUrl = urlTextController.text;
    notifyListeners();
    return Success(urlTextController.text);
  }

  Future<void> _pasteFromClipboard() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);

    if (clipboardData != null) {
      String? clipboardText = clipboardData.text;
      if (clipboardText != null) {
        urlTextController.text = clipboardText;
        notifyListeners();
        _log.info("Pasted from clipboard: $clipboardText");
      }
    }
  }
}
