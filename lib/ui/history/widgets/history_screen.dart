import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:maps_to_waze/core/errors/app_error.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
import 'package:maps_to_waze/ui/core/ui/custom_app_bar.dart';
import 'package:maps_to_waze/ui/core/ui/empty_state.dart';
import 'package:maps_to_waze/ui/core/ui/error_state.dart';
import 'package:maps_to_waze/ui/history/view_model/history_viewmodel.dart';
import 'package:maps_to_waze/ui/history/widgets/conversion_card.dart';
import 'package:shimmer/shimmer.dart';

class HistoryScreen extends StatefulWidget {
  final HistoryViewModel viewModel;

  const HistoryScreen({super.key, required this.viewModel});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
      setState(() {
        if (widget.viewModel.hasPendingUndo) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final count = widget.viewModel.lastDeletedCount;
            final messenger = ScaffoldMessenger.of(context);
            messenger.hideCurrentSnackBar();
            messenger.showSnackBar(
              SnackBar(
                content: Text("$count conversion${count == 1 ? '' : 's'} deleted"),
                duration: const Duration(seconds: 5),
                action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {
                    widget.viewModel.undoLastDeletion();
                  },
                ),
              ),
            );
            widget.viewModel.clearUndoFlag();
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.viewModel.isSelectingMode
            ? "${widget.viewModel.selectedCount} selected"
            : "Maps to Waze",
        actions: _getActions(),
      ),
      body: SafeArea(
        child: CommandBuilder(
          command: widget.viewModel.loadHistoryCommand,
          whileExecuting: (_, _, _) {
            final theme = Theme.of(context);
            final colorScheme = theme.colorScheme;
            return ListView.builder(
              itemCount: 4,
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.of(context).paddingScreenHorizontal,
                vertical: 8,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Shimmer.fromColors(
                    baseColor: colorScheme.surfaceContainerHighest,
                    highlightColor: colorScheme.surfaceContainerHigh,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Container(height: 150, color: Colors.white),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 16,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 12,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          onData: (context, data, _) {
            final pinnedUrl = widget.viewModel.lastPinnedUrl;
            if (pinnedUrl != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!context.mounted) return;
                final isPinned = widget.viewModel.isFavorite(pinnedUrl);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isPinned ? "Pinned to top" : "Unpinned"),
                    duration: const Duration(seconds: 2),
                  ),
                );
                widget.viewModel.clearPinnedFlag();
              });
            }

            final hasEmptySearch = widget.viewModel.visibleItemsCount == 0 &&
                (widget.viewModel.isShowingFavoritesOnly ||
                    widget.viewModel.searchController.text.isNotEmpty);

            return data.fold(
              (conversions) {
                if (conversions.isEmpty && !hasEmptySearch) {
                  return EmptyState(
                    icon: Icons.history,
                    title: "No conversions yet",
                    subtitle: "Share a Google Maps link to get started",
                  );
                }

                return Column(
                  children: [
                    _searchBar(theme, colorScheme),
                    Expanded(
                      child: hasEmptySearch
                          ? (widget.viewModel.isShowingFavoritesOnly
                              ? EmptyState(
                                  icon: Icons.favorite_border,
                                  title: "No favorites yet",
                                  subtitle: "Toggle the star on a conversion to save it as a favorite",
                                )
                              : EmptyState(
                                  icon: Icons.search_off,
                                  title: "No results found",
                                  subtitle: "Try a different search term",
                                ))
                          : _buildListView(theme, colorScheme),
                    ),
                  ],
                );
              },
              (error) {
                return ErrorState(
                  message: describeError(error),
                  onRetry: () => widget.viewModel.loadHistoryCommand.execute(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _searchBar(ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: TextField(
        controller: widget.viewModel.searchController,
        decoration: InputDecoration(
          hintText: "Search addresses...",
          prefixIcon: Icon(Icons.search),
          suffixIcon: widget.viewModel.searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: widget.viewModel.clearSearch,
                )
              : null,
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildListView(ThemeData theme, ColorScheme colorScheme) {
    final isSearching = widget.viewModel.searchController.text.isNotEmpty;

    Widget list = ListView.builder(
      itemCount: widget.viewModel.visibleItemsCount + (widget.viewModel.hiddenItems ? 1 : 0),
      itemBuilder: (context, index) {
        final child = index < widget.viewModel.visibleItemsCount
            ? ConversionCard(
                conversion: widget.viewModel.conversionAt(index),
                viewModel: widget.viewModel,
                index: index,
              ) as Widget
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      widget.viewModel.showMoreCommand.execute();
                    },
                    child: Text("Show more"),
                  ),
                ),
              );

        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: (300 + index * 50).clamp(0, 800)),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: child,
              ),
            );
          },
          child: child,
        );
      },
    );

    if (isSearching) {
      return list;
    }

    return RefreshIndicator(
      onRefresh: () => widget.viewModel.loadHistoryCommand.executeWithFuture(),
      child: list,
    );
  }

  List<Widget> _getActions() {
    if (widget.viewModel.isSelectingMode) {
      return [
        IconButton(
          icon: const Icon(Icons.close),
          tooltip: "Cancel selection",
          onPressed: () {
            widget.viewModel.clearSelectionCommand.execute();
          },
        ),
        IconButton(
          icon: Icon(
            widget.viewModel.isAllSelected
                ? Icons.deselect
                : Icons.select_all,
          ),
          tooltip: widget.viewModel.isAllSelected
              ? "Deselect all"
              : "Select all",
          onPressed: () {
            widget.viewModel.selectAllCommand.execute();
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          tooltip: "Delete conversions",
          onPressed: () {
            widget.viewModel.deleteSelectedItemsCommand.execute();
          },
        ),
      ];
    }

    return [
      if (widget.viewModel.hasFavorites)
        IconButton(
          icon: Icon(
            widget.viewModel.isShowingFavoritesOnly
                ? Icons.push_pin
                : Icons.push_pin_outlined,
          ),
          tooltip: widget.viewModel.isShowingFavoritesOnly
              ? "Show all"
              : "Favorites only",
          onPressed: widget.viewModel.toggleShowFavoritesOnly,
        ),
    ];
  }
}
