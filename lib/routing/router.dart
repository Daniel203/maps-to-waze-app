import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/convert_url/view_model/convert_url_viewmodel.dart';
import 'package:maps_to_waze/ui/convert_url/widgets/convert_url_screen.dart';
import 'package:maps_to_waze/ui/core/ui/custom_nav_bar.dart';
import 'package:maps_to_waze/ui/history/view_model/history_viewmodel.dart';
import 'package:maps_to_waze/ui/history/widgets/history_screen.dart';
import 'package:maps_to_waze/ui/home/view_model/home_viewmodel.dart';
import 'package:maps_to_waze/ui/home/widgets/home_screen.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'homeNav',
);
final GlobalKey<NavigatorState> _historyNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'historyNav');

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.convertUrlRelative,
      builder: (context, state) {
        final viewModel = ConvertUrlViewModel(
          urlConversionRepository: context.read(),
        );

        return ConvertUrlScreen(viewModel: viewModel);
      },
      routes: [
        GoRoute(
          path: ":encodedUrl",
          builder: (context, state) {
            final viewModel = ConvertUrlViewModel(
              urlConversionRepository: context.read(),
            );

            final String base64EncodedUrl =
                state.pathParameters["encodedUrl"] ?? "";
            final String url = utf8.decode(base64Url.decode(base64EncodedUrl));
            return ConvertUrlScreen(viewModel: viewModel, url: url);
          },
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CustomNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        // Home Tab
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.home,
              builder: (BuildContext context, GoRouterState state) {
                final viewModel = HomeViewModel();
                return HomeScreen(viewModel: viewModel);
              },
            ),
          ],
        ),
        // History Tab
        StatefulShellBranch(
          navigatorKey: _historyNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.history,
              builder: (BuildContext context, GoRouterState state) {
                final viewModel = HistoryViewModel(
                  historyRepository: context.read(),
                  urlConversionRepository: context.read(),
                );
                return HistoryScreen(viewModel: viewModel);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
