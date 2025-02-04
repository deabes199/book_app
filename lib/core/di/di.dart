import 'package:book_app/core/database/shared_pref.dart';
import 'package:book_app/core/networking/api_services.dart';
import 'package:book_app/feathers/details/data/repo/smailr_repo.dart';
import 'package:book_app/feathers/details/logic/cubit/smailr_cubit.dart';
import 'package:book_app/feathers/favoriets/logic/cubit/favorite_cubit.dart';
import 'package:book_app/feathers/home/data/repo/home_repo.dart';
import 'package:book_app/feathers/home/logic/cubit/newest/newest_cubit.dart';
import 'package:book_app/feathers/home/logic/cubit/recommended/recommended_cubit.dart';
import 'package:book_app/feathers/search/data/search_repo.dart';
import 'package:book_app/feathers/search/logic/cubit/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUp() {
  Dio dio = Dio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
  getIt.registerFactory<RecommendedCubit>(() => RecommendedCubit(getIt()));
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerFactory<NewestCubit>(() => NewestCubit(getIt()));
  getIt.registerFactory<FavoriteCubit>(() => FavoriteCubit());
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
  getIt.registerLazySingleton<SmailerRepo>(
      () => SmailerRepo(apiServices: getIt()));
  getIt.registerFactory<SmailerCubit>(() => SmailerCubit(getIt()));
}
