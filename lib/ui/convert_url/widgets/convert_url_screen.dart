import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/convert_url/view_model/convert_url_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ConvertUrlScreen extends StatelessWidget {
  final ConvertUrlViewModel viewModel;

  const ConvertUrlScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CommandBuilder(
          command: viewModel.convertUrlCommand,
          whileExecuting: (_, _, _) {
            return Center(child: CircularProgressIndicator());
          },
          onData: (context, data, _) {
            return data.fold(
              (Uri uri) {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  context.go(Routes.home);
                  await launchUrl(uri);
                });

                return SizedBox.shrink();
              },
              (error) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.go(Routes.home);
                });
                return SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
