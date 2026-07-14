import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/core/errors/app_error.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/core/ui/error_state.dart';
import 'package:maps_to_waze/ui/convert_url/view_model/convert_url_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ConvertUrlScreen extends StatefulWidget {
  final ConvertUrlViewModel viewModel;
  final String? url;

  const ConvertUrlScreen({super.key, required this.viewModel, this.url});

  @override
  State<ConvertUrlScreen> createState() => _ConvertUrlScreenState();
}

class _ConvertUrlScreenState extends State<ConvertUrlScreen> {
  String? _currentUrl;

  @override
  void initState() {
    super.initState();
    if (widget.url != null) {
      _currentUrl = widget.url;
      widget.viewModel.convertUrlCommand.execute(widget.url!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Converting"),
      ),
      body: SafeArea(
        child: widget.url == null
            ? _noUrlView(theme, colorScheme)
            : CommandBuilder(
                command: widget.viewModel.convertUrlCommand,
                whileExecuting: (_, _, _) {
                  return _loadingView(theme, colorScheme);
                },
                onData: (context, data, _) {
                  return data.fold(
                    (uri) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        await launchUrl(uri);
                        if (context.mounted) context.go(Routes.history);
                      });
                      return _successView(theme, colorScheme);
                    },
                    (error) => _errorView(error, theme, colorScheme),
                  );
                },
              ),
      ),
    );
  }

  Widget _loadingView(ThemeData theme, ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 24),
            Text(
              "Converting your link...",
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 8),
            Text(
              _currentUrl ?? "",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _successView(ThemeData theme, ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 64,
            color: colorScheme.primary,
          ),
          SizedBox(height: 16),
          Text(
            "Opening in Waze...",
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _noUrlView(ThemeData theme, ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.link_off,
              size: 48,
              color: colorScheme.onSurfaceVariant,
            ),
            SizedBox(height: 16),
            Text(
              "No URL provided",
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.go(Routes.home),
              child: Text("Back to home"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _errorView(AppError error, ThemeData theme, ColorScheme colorScheme) {
    return ErrorState(
      message: describeError(error),
      onRetry: _currentUrl != null
          ? () => widget.viewModel.convertUrlCommand.execute(_currentUrl!)
          : null,
      onBack: () => context.go(Routes.home),
    );
  }
}
