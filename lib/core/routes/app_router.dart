import 'package:book_app/core/di/di.dart';
import 'package:book_app/core/routes/routes.dart';
import 'package:book_app/feathers/details/logic/cubit/smailr_cubit.dart';
import 'package:book_app/feathers/details/ui/screen/book_details_screen.dart';
import 'package:book_app/feathers/favoriets/logic/cubit/favorite_cubit.dart';
import 'package:book_app/feathers/favoriets/ui/screen/favorites_screen.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/home/logic/cubit/newest/newest_cubit.dart';
import 'package:book_app/feathers/home/logic/cubit/recommended/recommended_cubit.dart';
import 'package:book_app/feathers/home/ui/screen/home_screen.dart';
import 'package:book_app/feathers/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:book_app/feathers/on_boarding/ui/screens/splash_screen.dart';
import 'package:book_app/feathers/search/logic/cubit/search_cubit.dart';
import 'package:book_app/feathers/search/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          getIt<NewestCubit>()..getNewestlBook(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          getIt<RecommendedCubit>()..getProgrammingBook(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<SmailerCubit>(),
                    ),
                  ],
                  child: const HomeScreen(),
                ));
      case Routes.bookDetails:
        final arg = settings.arguments as Items;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          getIt<FavoriteCubit>()..getFavorite(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<SmailerCubit>()..getSmailerBook(category: arg.volumeInfo!.categories![0]),
                    ),
                  ],
                  child: BookDetailsScreen(
                    bookModel: arg,
                  ),
                ));

      case Routes.favoirteScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<FavoriteCubit>()..getFavorite(),
                  child: const FavoritesScreen(),
                ));
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.searchScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SearchCubit>(),
                  child: SearchScreen(),
                ));

      default:
        const Scaffold(
          body: Center(
            child: Text('Not found'),
          ),
        );
    }
    return null;
  }
}
