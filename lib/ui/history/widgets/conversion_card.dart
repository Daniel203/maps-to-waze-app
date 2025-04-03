import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
import 'package:url_launcher/url_launcher.dart';

class ConversionCard extends StatelessWidget {
  final Conversion conversion;

  const ConversionCard({super.key, required this.conversion});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        left: Dimens.of(context).paddingScreenHorizontal,
        right: Dimens.of(context).paddingScreenHorizontal,
        bottom: Dimens.of(context).paddingScreenVertical,
      ),
      clipBehavior: Clip.antiAlias, // Clip the map to the shape of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _staticMapImage(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${conversion.coordinates.latitude}, ${conversion.coordinates.longitude}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    FilledButton(
                      onPressed: () async {
                        Uri wazeUri = conversion.url;
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
      ),
    );
  }

  Widget _staticMapImage(BuildContext context) {
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
}
