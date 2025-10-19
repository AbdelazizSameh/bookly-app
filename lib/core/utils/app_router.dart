import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/details_view.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/home/data/repos/home_repo_implementation.dart';
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
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
          child: DetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: RoutePath.kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SearchBookCubit(getIt.get<SearchRepoImplementation>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}

abstract class RoutePath {
  static const kSplashView = '/';
  static const kHomeView = '/homeView';
  static const kDetailsView = '/detailsView';
  static const kSearchView = '/searchView';
}
