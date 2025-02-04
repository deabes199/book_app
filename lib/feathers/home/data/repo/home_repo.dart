import 'package:book_app/core/networking/api_error_handler.dart';
import 'package:book_app/core/networking/api_services.dart';
import 'package:book_app/core/networking/error_model.dart';
import 'package:book_app/core/utils/app_strings.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class HomeRepo {
  final ApiServices apiServices;

  HomeRepo(this.apiServices);
  final Box<BookModel> programmingBox = Hive.box(AppStrings.progrmmingKey);
  final Box<BookModel> newestBox = Hive.box(AppStrings.newestKey);
  Future<Either<ErrorModel, BookModel>> getProgrammingBook({
    int page = 0,
  }) async {
    String cacheKey = 'pro$page';
    if (programmingBox.containsKey(cacheKey)) {
      final cachedData = programmingBox.get(cacheKey);
      if (cachedData != null) {
        print('loading from hive');
        return right(cachedData);
      }
      return left(ErrorModel('no data from hive'));
    }

    try {
      final response = await apiServices.getProgrammingBook(page: page * 10);
      programmingBox.put(cacheKey, response);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ApiErrorHandler.fromDioError(e));
      } else {
        return left(ErrorModel(e.toString()));
      }
    }
  }

  Future<Either<ErrorModel, BookModel>> getNewestBook({int page = 0}) async {
    String newestKey = 'newest$page';
    if (newestBox.containsKey(newestKey)) {
      final cacheDate = newestBox.get(newestKey);
      if (cacheDate != null) {
        print('newest from hive ##################################');
        return right(cacheDate);
      }
      return left(ErrorModel('Data Not Found'));
    }
    try {
      final response = await apiServices.getNewestBook(page: page * 10);
      newestBox.put(newestKey, response);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ApiErrorHandler.fromDioError(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
    }
  }
}
