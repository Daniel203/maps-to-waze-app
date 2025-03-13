import 'package:go_router/go_router.dart';
import 'package:maps_to_waze/routing/routes.dart';
import 'package:maps_to_waze/ui/home/view/home_screen.dart';
import 'package:maps_to_waze/ui/home/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) {
      final viewModel = HomeViewModel(urlConversionRepository: context.read());
      return HomeScreen(viewModel: viewModel);
    })
  ]
);
