import 'package:flutter/material.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
import 'package:maps_to_waze/ui/home/view_model/home_viewmodel.dart';

class UrlInput extends StatelessWidget {
  final HomeViewModel viewModel;

  const UrlInput({super.key, required this.viewModel});

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
        onChanged: viewModel.urlChangedCommand.call,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Maps URL",
          hintText: "https://maps.app.goo.gl/...",
        ),
      ),
    );
  }
}
