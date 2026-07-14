import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? title;

  const CustomAppBar({super.key, this.actions, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "Maps to Waze"),
      actions: actions,
      scrolledUnderElevation: 3.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
