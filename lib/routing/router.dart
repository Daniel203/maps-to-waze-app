import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/core/ui/custom_nav_bar.dart';
import 'package:maps_to_waze/ui/history/view/history_screen.dart';
import 'package:maps_to_waze/ui/home/view/home_screen.dart';
import 'package:maps_to_waze/ui/home/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'homeNav',
);
final GlobalKey<NavigatorState> _historyNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'historyNav');

GoRouter router() => GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
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
                final viewModel = HomeViewModel(
                  urlConversionRepository: context.read(),
                );
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
                return HistoryScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
