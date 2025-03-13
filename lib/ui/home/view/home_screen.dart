import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:maps_to_waze/ui/core/ui/custom_app_bar.dart';
import 'package:maps_to_waze/ui/home/view_models/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        top: true,
        bottom: true,
        child: CommandBuilder(
          command: widget.viewModel.load,
          whileExecuting:
              (_, _, _) => Center(child: CircularProgressIndicator()),
          onData: (_, _, _) => Center(child: Text("Finished")),
          onError:
              (_, error, _, _) => Column(
                children: [
                  Text('An Error has occurred!'),
                  Text(error.toString()),
                ],
              ),
        ),
      ),
    );
  }
}
