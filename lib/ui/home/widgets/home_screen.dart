import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/core/ui/custom_app_bar.dart';
import 'package:maps_to_waze/ui/home/view_model/home_viewmodel.dart';
import 'package:maps_to_waze/ui/home/widgets/url_input.dart';
import 'package:maps_to_waze/ui/home/widgets/url_submit.dart';

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
    widget.viewModel.addListener(_onViewModelChanged);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  void _onViewModelChanged() {
    final url = widget.viewModel.consumePendingUrl();
    if (url != null) {
      context.go(Routes.convertUrl(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UrlInput(viewModel: widget.viewModel),
            UrlSubmit(viewModel: widget.viewModel),
          ],
        ),
      ),
    );
  }
}
