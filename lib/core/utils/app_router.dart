import 'package:bookly_app/Features/home/presentation/views/details_view.dart';
import 'package:go_router/go_router.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final GoRouter appRouter = GoRouter(
    routes: [
      GoRoute(
        path: RoutePath.kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RoutePath.kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: RoutePath.kDetailsView,
        builder: (context, state) => const DetailsView(),
      ),
    ],
  );
}

abstract class RoutePath {
  static const kSplashView = '/';
  static const kHomeView = '/homeView';
  static const kDetailsView = '/detailsView';
}
