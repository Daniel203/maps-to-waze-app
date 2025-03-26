import 'package:flutter/material.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
import 'package:maps_to_waze/ui/home/view_model/home_viewmodel.dart';

class UrlInput extends StatefulWidget {
  final HomeViewModel viewModel;

  const UrlInput({super.key, required this.viewModel});

  @override
  State<UrlInput> createState() => _UrlInputState();
}

class _UrlInputState extends State<UrlInput> {
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
      child: TextField(
        onChanged: widget.viewModel.urlChangedCommand.call,
        controller: widget.viewModel.urlTextController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Maps URL",
          suffixIcon: Tooltip(
            message: "Paste from clipboard",
            child: IconButton(
              icon: const Icon(Icons.paste),
              onPressed: () => widget.viewModel.pasteFromClipboard.execute(),
            ),
          ),
        ),
      ),
    );
  }
}
