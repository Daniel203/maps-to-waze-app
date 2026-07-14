import 'package:flutter/material.dart';
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

  String? _errorText() {
    final text = widget.viewModel.urlTextController.text;
    if (text.isEmpty) return null;
    return widget.viewModel.valid ? null : "Enter a valid URL";
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.viewModel.urlChangedCommand.call,
      controller: widget.viewModel.urlTextController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Maps URL",
        errorText: _errorText(),
        suffixIcon: Tooltip(
          message: "Paste from clipboard",
          child: IconButton(
            icon: const Icon(Icons.content_paste_go),
            onPressed: () => widget.viewModel.pasteFromClipboard.execute(),
          ),
        ),
      ),
    );
  }
}
