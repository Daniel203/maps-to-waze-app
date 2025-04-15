import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
import 'package:maps_to_waze/ui/history/view_model/history_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ConversionCard extends StatefulWidget {
  final int index;
  final HistoryViewModel viewModel;
  final Conversion conversion;

  const ConversionCard({
    super.key,
    required this.conversion,
    required this.index,
    required this.viewModel,
  });

  @override
  State<ConversionCard> createState() => _ConversionCardState();
}

class _ConversionCardState extends State<ConversionCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        widget.viewModel.toggleItemSelectedStateCommand.execute(widget.index);
        HapticFeedback.selectionClick();
      },
      onTap: () {
        if (widget.viewModel.isSelectingMode) {
          widget.viewModel.toggleItemSelectedStateCommand.execute(widget.index);
          HapticFeedback.selectionClick();
        }
      },

      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.only(
              left: Dimens.of(context).paddingScreenHorizontal,
              right: Dimens.of(context).paddingScreenHorizontal,
              bottom: Dimens.of(context).paddingScreenVertical / 2,
              top: Dimens.of(context).paddingScreenVertical / 2,
            ),
            clipBehavior: Clip.antiAlias,
            child: Builder(
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _staticMapImage(context, widget.conversion),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _getCardText(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              FilledButton(
                                onPressed: () async {
                                  if (widget.viewModel.isSelectingMode) {
                                    return;
                                  }
                                  Uri wazeUri = widget.conversion.url;
                                  await launchUrl(wazeUri);
                                },
                                child: const Text('Launch'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (widget.viewModel.isSelected(widget.index))
            Positioned.fill(
              child: Container(color: Colors.blue.withValues(alpha: 0.4)),
            ),
        ],
      ),
    );
  }

  Widget _staticMapImage(BuildContext context, Conversion conversion) {
    Widget child;

    if (conversion.mapImagePath != null) {
      child = Image.file(File(conversion.mapImagePath!), fit: BoxFit.cover);
    } else {
      child = Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(child: Text("Image not found")),
      );
    }

    return Center(
      child: SizedBox(height: 150, width: double.infinity, child: child),
    );
  }

  String _getCardText() {
    if (widget.conversion.addressLine1 != null &&
        widget.conversion.addressLine2 != null) {
      return "${widget.conversion.addressLine1} \n ${widget.conversion.addressLine2}";
    }

    return "${widget.conversion.coordinates.latitude}, ${widget.conversion.coordinates.longitude}";
  }
}
