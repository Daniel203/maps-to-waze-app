import 'package:flutter/material.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
import 'package:maps_to_waze/ui/home/view_model/home_viewmodel.dart';

const String urlInputSubmitButtonKey = 'url-input-submit-button';

class UrlSubmit extends StatelessWidget {
  final HomeViewModel viewModel;

  const UrlSubmit({super.key, required this.viewModel});

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
        onPressed: viewModel.sumbitUrlCommand.execute,
        child: Text("Open in waze"),
      ),
    );
  }
}
