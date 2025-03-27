import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:maps_to_waze/data/services/local_storage/models/conversion/conversion.dart';
import 'package:maps_to_waze/ui/core/ui/custom_app_bar.dart';
import 'package:maps_to_waze/ui/history/view_model/history_viewmodel.dart';

class HistoryScreen extends StatelessWidget {
  final HistoryViewModel viewModel;

  const HistoryScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: CommandBuilder(
          command: viewModel.loadHistoryCommand,
          whileExecuting: (_, _, _) {
            return Center(child: CircularProgressIndicator());
          },
          onData: (context, data, _) {
            return data.fold(
              (List<Conversion> conversions) {
                return SizedBox.shrink();
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
}
