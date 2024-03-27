import 'package:go_router/go_router.dart';
import 'package:location/src/ui/pages/gps_map/gps_map_page.dart';
import 'package:location/src/ui/pages/init/init_page.dart';
import 'package:location/src/ui/ui_helpers/app_routes.dart';

sealed class AppRouter {
  static final GoRouter instance = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: AppRoutes.init, builder: (context, state) => const InitPage()),
    GoRoute(path: AppRoutes.gpsMap, builder: (context, state) => const GPSMapPage())
  ]);
}
