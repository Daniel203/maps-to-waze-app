import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  double? scrolledUnderElevation;
  bool shadowColor = false;

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Maps to Waze"),
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
