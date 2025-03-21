import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/main/view_model/main_viewmodel.dart';

class MainScreen extends StatefulWidget {
  final MainViewModel viewModel;

  const MainScreen({super.key, required this.viewModel});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Center(child: CircularProgressIndicator()),
        // child: CommandBuilder(
        //   command: widget.viewModel.convertUrlAndRedirect,
        //   whileExecuting: (_, _, _) {
        //     return Center(child: CircularProgressIndicator());
        //   },
        //   onData: (_, _, _) {
        //     return Center(child: CircularProgressIndicator());
        //   },
        //   onError:
        //       (_, error, _, _) => Column(
        //         children: [
        //           Text('An Error has occurred!'),
        //           Text(error.toString()),
        //         ],
        //       ),
        // ),
      ),
    );
  }
}
