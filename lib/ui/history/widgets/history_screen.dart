import 'package:flutter/material.dart';
import 'package:maps_to_waze/ui/core/ui/custom_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(child: Center(child: Text("History"))),
    );
  }
}
