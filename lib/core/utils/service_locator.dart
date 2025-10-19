import 'package:bookly_app/Features/search/data/repos/search_repo_implementation.dart';

import '/Features/home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(apiService: getIt.get<ApiService>()),
  );
}
