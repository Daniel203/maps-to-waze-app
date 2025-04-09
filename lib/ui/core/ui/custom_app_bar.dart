import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? scrolledUnderElevation = null;
  final bool shadowColor = false;
  final List<Widget>? actions;

  const CustomAppBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Maps to Waze"),
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
