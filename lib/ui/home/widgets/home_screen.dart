import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/core/themes/dimens.dart';
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

  void _showFormatsInfo(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Supported URL formats",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              _formatRow(
                Icons.map,
                "Google Maps",
                "maps.google.com links, place URLs, direction links, and search results",
              ),
              SizedBox(height: 12),
              _formatRow(
                Icons.link,
                "Google short links",
                "goo.gl/maps and maps.app.goo.gl shared links",
              ),
              SizedBox(height: 24),
              Text(
                "Paste any supported URL above and tap Open in Waze to convert.",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _formatRow(IconData icon, String title, String description) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: colorScheme.primary),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final dimens = Dimens.of(context);

    return Scaffold(
      appBar: CustomAppBar(actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: "Supported formats",
          onPressed: () => _showFormatsInfo(context),
        ),
      ]),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: dimens.paddingScreenHorizontal,
              vertical: Dimens.paddingVertical,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(dimens.paddingScreenHorizontal),
                    child: Column(
                      children: [
                        UrlInput(viewModel: widget.viewModel),
                        SizedBox(height: 16),
                        UrlSubmit(viewModel: widget.viewModel),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                _buildSteps(theme, colorScheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSteps(ThemeData theme, ColorScheme colorScheme) {
    final steps = [
      (
        icon: Icons.copy,
        label: "Copy a Google Maps link from your phone",
      ),
      (
        icon: Icons.content_paste_go,
        label: "Paste it here and tap Open in Waze",
      ),
      (
        icon: Icons.navigation,
        label: "Waze opens with your route ready to go",
      ),
    ];

    return Column(
      children: [
        SizedBox(
          width: 60,
          child: Divider(),
        ),
        SizedBox(height: 24),
        for (int i = 0; i < steps.length; i++) ...[
          if (i > 0) SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "${i + 1}",
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Icon(
                steps[i].icon,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  steps[i].label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
