import 'package:booklyapp/features/home/data/repos/home_repo_implemention.dart';
import 'package:booklyapp/features/search/data/repo/search_repo_implemention.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplemention>(
    HomeRepoImplemention(getIt.get<ApiService>()),
  );
    getIt.registerSingleton<SearchRepoImplemention>(
    SearchRepoImplemention(getIt.get<ApiService>()),
  );
}
