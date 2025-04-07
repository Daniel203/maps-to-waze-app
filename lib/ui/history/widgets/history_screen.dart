import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:maps_to_waze/ui/core/ui/custom_app_bar.dart';
import 'package:maps_to_waze/ui/history/view_model/history_viewmodel.dart';
import 'package:maps_to_waze/ui/history/widgets/conversion_card.dart';

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
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(actions: _getActions()),
      body: SafeArea(
        child: CommandBuilder(
          command: widget.viewModel.loadHistoryCommand,
          whileExecuting: (_, _, _) {
            return Center(child: CircularProgressIndicator());
          },
          onData: (context, data, _) {
            return data.fold(
              (conversions) {
                if (conversions.isEmpty) {
                  return Center(child: Text("No conversion history"));
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.viewModel.visibleItemsCount + 1,
                        itemBuilder: (context, index) {
                          if (index < widget.viewModel.visibleItemsCount) {
                            return ConversionCard(
                              conversion: conversions[index],
                              viewModel: widget.viewModel,
                              index: index,
                            );
                          } else if (widget.viewModel.hiddenItems) {
                            return TextButton(
                              onPressed: () {
                                widget.viewModel.showMoreCommand.execute();
                              },
                              child: Text("Show more"),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                );
              },
              (error) {
                return Center(
                  child: Text("Failed to retrieve conversion history"),
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<Widget> _getActions() {
    if (widget.viewModel.isSelectingMode) {
      List<Widget> actions = [];
      actions.add(
        IconButton(
          icon: const Icon(Icons.delete),
          tooltip: "Delete conversions",
          onPressed: () {
            widget.viewModel.deleteSelectedItemsCommand.execute();
          },
        ),
      );

      return actions;
    }

    return [];
  }
}
