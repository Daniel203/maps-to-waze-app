import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion.dart';
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
      clipBehavior:
          Clip.antiAlias, // Clip the map to the shape of the card, so it keeps the rounded corners
      child: SizedBox(
        height: 250.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: OSMViewer(
                controller: SimpleMapController(
                  initPosition: GeoPoint(
                    latitude: double.parse(conversion.latitude),
                    longitude: double.parse(conversion.longitude),
                  ),
                  markerHome: MarkerIcon(icon: Icon(Icons.location_on)),
                ),
                zoomOption: const ZoomOption(initZoom: 11),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${conversion.latitude}, ${conversion.longitude}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      FilledButton(
                        onPressed: () async {
                          Uri wazeUri = Uri.parse(conversion.url);
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
      ),
    );
  }
}
