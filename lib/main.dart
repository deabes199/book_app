import 'package:book_app/bloc_observer.dart';
import 'package:book_app/core/database/hive_services.dart';
import 'package:book_app/core/database/shared_pref.dart';
import 'package:book_app/core/di/di.dart';
import 'package:book_app/core/routes/app_router.dart';
import 'package:book_app/core/routes/routes.dart';
import 'package:book_app/core/utils/app_strings.dart';
import 'package:book_app/feathers/favoriets/data/models/favorite_model.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await getIt<CacheHelper>().init();
  Bloc.observer = MyBlocObserver();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(FavoriteModelAdapter());
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(ItemsAdapter());
  Hive.registerAdapter(VolumeInfoAdapter());
  Hive.registerAdapter(PdfAdapter());
  Hive.registerAdapter(ImageLinksAdapter());
  await HiveService.init();
  await Hive.openBox<BookModel>(AppStrings.progrmmingKey);
  await Hive.openBox<BookModel>(AppStrings.newestKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
