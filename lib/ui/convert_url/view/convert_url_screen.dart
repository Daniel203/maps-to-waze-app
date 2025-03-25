import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/convert_url/view_model/convert_url_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ConvertUrlScreen extends StatefulWidget {
  final ConvertUrlViewModel viewModel;

  const ConvertUrlScreen({super.key, required this.viewModel});

  @override
  State<ConvertUrlScreen> createState() => _ConvertUrlScreenState();
}

class _ConvertUrlScreenState extends State<ConvertUrlScreen> {
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
        child: CommandBuilder(
          command: widget.viewModel.convertUrl,
          whileExecuting: (_, _, _) {
            return Center(child: CircularProgressIndicator());
          },
          onData: (context, data, _) {
            return data.fold(
              (Uri uri) {
                // The first time it reads the initial value which is empty by design
                if (!uri.hasAbsolutePath) {
                  return Center(child: CircularProgressIndicator());
                }

                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  context.go(Routes.home);
                  await launchUrl(uri);
                });

                return Center(child: Text('Success!'));
              },
              (error) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.go(Routes.home);
                });
                return Center(child: Text('Failure!'));
              },
            );
          },
        ),
      ),
    );
  }
}
