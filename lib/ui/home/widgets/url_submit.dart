import 'package:flutter/material.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
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
    return Padding(
      padding: EdgeInsets.only(
        top: Dimens.paddingVertical,
        left: Dimens.of(context).paddingScreenHorizontal,
        right: Dimens.of(context).paddingScreenHorizontal,
        bottom: Dimens.of(context).paddingScreenVertical,
      ),
      child: FilledButton(
        key: const ValueKey(urlInputSubmitButtonKey),
        onPressed:
            widget.viewModel.valid
                ? widget.viewModel.submitUrlCommand.execute
                : null,
        child: Text("Open in Waze"),
      ),
    );
  }
}
