import 'package:go_router/go_router.dart';
import 'package:location/src/ui/pages/home/home_page.dart';
import 'package:location/src/ui/pages/init/init_page.dart';

sealed class AppRouter {
  static final GoRouter instance = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: '/', builder: (context, state) => const InitPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage())
  ]);
}
