import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maps_to_waze/ui/home/view_model/home_viewmodel.dart';

const String urlInputSubmitButtonKey = 'url-input-submit-button';

class UrlSubmit extends StatefulWidget {
  final HomeViewModel viewModel;

  const UrlSubmit({super.key, required this.viewModel});

  @override
  State<UrlSubmit> createState() => _UrlSubmitState();
}

class _UrlSubmitState extends State<UrlSubmit> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_viewModelListener);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_viewModelListener);
    super.dispose();
  }

  void _viewModelListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        key: const ValueKey(urlInputSubmitButtonKey),
        onPressed:
            widget.viewModel.valid
                ? () {
                    HapticFeedback.lightImpact();
                    widget.viewModel.submitUrlCommand.execute();
                  }
                : null,
        icon: const Icon(Icons.navigation),
        label: const Text("Open in Waze"),
      ),
    );
  }
}
