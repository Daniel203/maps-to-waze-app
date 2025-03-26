import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/core/ui/custom_app_bar.dart';
import 'package:maps_to_waze/ui/home/view_model/home_viewmodel.dart';
import 'package:maps_to_waze/ui/home/widgets/url_input.dart';
import 'package:maps_to_waze/ui/home/widgets/url_submit.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UrlInput(viewModel: viewModel),
            UrlSubmit(viewModel: viewModel),
            CommandBuilder(
              command: viewModel.sumbitUrlCommand,
              onData: (context, data, _) {
                return data.fold(
                  (String url) { 
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.go(Routes.convertUrl(url));
                    });
                    return SizedBox.shrink();
                  },
                  (error) => SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
