import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:maps_to_waze/domain/models/conversion/conversion.dart';
import 'package:shimmer/shimmer.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
import 'package:maps_to_waze/ui/history/view_model/history_viewmodel.dart';
import 'package:share_plus/share_plus.dart';
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
  bool _showPulse = false;
  int _pulseKey = 0;

  @override
  void initState() {
    super.initState();
    if (widget.viewModel.lastPinnedUrl == widget.conversion.url.toString()) {
      _showPulse = true;
    }
  }

  @override
  void didUpdateWidget(ConversionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    final now = widget.viewModel.lastPinnedUrl == widget.conversion.url.toString();
    final was = oldWidget.viewModel.lastPinnedUrl == widget.conversion.url.toString();
    if (!was && now) {
      _pulseKey++;
      _showPulse = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.viewModel.isSelected(widget.index);
    final isSelectionMode = widget.viewModel.isSelectingMode;
    final isExiting = widget.viewModel.exitingItemKeys
        ?.contains(widget.conversion.url.toString()) ?? false;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget result = Padding(
      padding: EdgeInsets.only(
        left: Dimens.of(context).paddingScreenHorizontal,
        right: Dimens.of(context).paddingScreenHorizontal,
        bottom: Dimens.paddingVertical / 3,
        top: Dimens.paddingVertical / 3,
      ),
        child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                HapticFeedback.mediumImpact();
                widget.viewModel.deleteSingleConversion(widget.index);
              },
              backgroundColor: theme.colorScheme.error,
              foregroundColor: theme.colorScheme.onError,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Card(
        clipBehavior: Clip.antiAlias,
        shape: isSelected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: colorScheme.primary, width: 2),
              )
            : null,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () async {
              if (isSelectionMode) {
                widget.viewModel.toggleItemSelectedStateCommand.execute(
                  widget.index,
                );
                HapticFeedback.selectionClick();
                return;
              }
              HapticFeedback.lightImpact();
              Uri wazeUri = widget.conversion.url;
              if (!await launchUrl(wazeUri)) {
                developer.log("Failed to launch URL: $wazeUri");
              }
            },
            onLongPress: () {
              widget.viewModel.toggleItemSelectedStateCommand.execute(
                widget.index,
              );
              HapticFeedback.mediumImpact();
            },
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        _staticMapImage(context, widget.index, widget.conversion),
                        if (!isSelectionMode)
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorScheme.surface.withValues(alpha: 0.85),
                                shape: BoxShape.circle,
                              ),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                transitionBuilder: (child, animation) {
                                  return RotationTransition(
                                    turns: animation,
                                    child: child,
                                  );
                                },
                                child: IconButton(
                                  key: ValueKey(widget.conversion.isFavorite),
                                  icon: Icon(
                                    widget.conversion.isFavorite
                                        ? Icons.push_pin
                                        : Icons.push_pin_outlined,
                                    size: 20,
                                  ),
                                  color: widget.conversion.isFavorite
                                      ? colorScheme.primary
                                      : colorScheme.onSurface.withValues(alpha: 0.6),
                                  onPressed: () {
                                    widget.viewModel.toggleFavorite(
                                      widget.conversion,
                                    );
                                  },
                                  tooltip: widget.conversion.isFavorite
                                      ? "Remove from favorites"
                                      : "Add to favorites",
                                  visualDensity: VisualDensity.compact,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        Dimens.of(context).paddingScreenHorizontal,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getCardText(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (widget.conversion.formattedAddress != null &&
                                    widget.conversion.addressLine1 == null &&
                                    widget.conversion.addressLine2 == null) ...[
                                  SizedBox(height: 4),
                                  Text(
                                    widget.conversion.formattedAddress!,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.share, size: 18),
                            tooltip: "Share Waze URL",
                            visualDensity: VisualDensity.compact,
                            onPressed: () {
                              SharePlus.instance.share(ShareParams(
                                text: widget.conversion.url.toString(),
                              ));
                            },
                          ),
                          SizedBox(width: 4),
                          SizedBox(
                            width: 36,
                            height: 36,
                            child: FilledButton.tonal(
                              onPressed: () async {
                                Uri wazeUri = widget.conversion.url;
                                if (!await launchUrl(wazeUri)) {
                                  developer.log("Failed to launch URL: $wazeUri");
                                }
                              },
                              style: FilledButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                              ),
                              child: Icon(Icons.open_in_new, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (isSelected)
                  Positioned.fill(
                    child: Container(
                      color: colorScheme.primary.withValues(alpha: 0.12),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      ),
    );

    if (_showPulse) {
      result = TweenAnimationBuilder<double>(
        key: ValueKey('pulse_$_pulseKey'),
        tween: Tween(begin: 1.05, end: 1.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        onEnd: () {
          if (mounted) setState(() => _showPulse = false);
        },
        builder: (context, scale, child) => Transform.scale(
          scale: scale,
          child: child,
        ),
        child: result,
      );
    }

    if (isExiting) {
      result = TweenAnimationBuilder<double>(
        key: const ValueKey('exit'),
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
        builder: (context, value, child) {
          return Opacity(
            opacity: 1.0 - value,
            child: Transform.translate(
              offset: Offset(50 * value, 0),
              child: child,
            ),
          );
        },
        child: result,
      );
    }

    return result;
  }

  Widget _staticMapImage(
    BuildContext context,
    int index,
    Conversion conversion,
  ) {
    Widget child;

    if (conversion.mapImagePath != null) {
      final file = File(conversion.mapImagePath!);
      if (file.existsSync()) {
        child = Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            developer.log(
              "Image decode error: $error",
              error: error,
              stackTrace: stackTrace,
            );
            return _imagePlaceholder(context, "Failed to load image");
          },
        );
      } else {
        developer.log(
          "Image file not found on disk: ${conversion.mapImagePath}",
        );
        child = _imagePlaceholder(context, "Image file missing");
      }
    } else if (widget.viewModel.isHydrating(index)) {
      child = Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        highlightColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: Container(color: Colors.white),
      );
    } else {
      child = _imagePlaceholder(context, "Image not found");
    }

    return Center(
      child: SizedBox(height: 150, width: double.infinity, child: child),
    );
  }

  Widget _imagePlaceholder(
    BuildContext context,
    String? text, {
    bool showSpinner = false,
  }) {
    return Container(
      color: showSpinner
          ? Theme.of(context).colorScheme.surfaceContainerHighest
          : Theme.of(context).colorScheme.primaryContainer,
      child: Center(
        child: showSpinner ? CircularProgressIndicator() : Text(text ?? ""),
      ),
    );
  }

  String _getCardText() {
    final parts = <String>[];
    if (widget.conversion.addressLine1 != null) {
      parts.add(widget.conversion.addressLine1!);
    }
    if (widget.conversion.addressLine2 != null) {
      parts.add(widget.conversion.addressLine2!);
    }
    if (parts.isNotEmpty) {
      return parts.join('\n');
    }
    return "${widget.conversion.coordinates.latitude}, ${widget.conversion.coordinates.longitude}";
  }
}
