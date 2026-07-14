import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final VoidCallback? onBack;

  const ErrorState({
    super.key,
    required this.message,
    this.onRetry,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: colorScheme.error,
            ),
            SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 24),
            if (onRetry != null)
              FilledButton(
                onPressed: onRetry,
                child: Text("Try again"),
              ),
            if (onBack != null) ...[
              SizedBox(height: 8),
              TextButton(
                onPressed: onBack,
                child: Text("Back to home"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
