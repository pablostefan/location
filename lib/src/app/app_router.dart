import 'package:go_router/go_router.dart';
import 'package:location/src/ui/pages/api_map/api_map_page.dart';
import 'package:location/src/ui/pages/gps_map/gps_map_page.dart';
import 'package:location/src/ui/pages/init/init_page.dart';
import 'package:location/src/ui/ui_helpers/app_routes.dart';

sealed class AppRouter {
  static final GoRouter instance = GoRouter(initialLocation: AppRoutes.init, routes: [
    GoRoute(path: AppRoutes.init, builder: (context, state) => const InitPage()),
    GoRoute(path: AppRoutes.gpsMap, builder: (context, state) => const GPSMapPage()),
    GoRoute(path: AppRoutes.apiMap, builder: (context, state) => const APIMapPage())
  ]);
}
