import 'package:book_app/core/networking/api_error_handler.dart';
import 'package:book_app/core/networking/api_services.dart';
import 'package:book_app/core/networking/error_model.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SmailerRepo {
  final ApiServices apiServices;

  SmailerRepo({required this.apiServices});
  Future<Either<ErrorModel, BookModel>> getSmailrBook(
      {required String category}) async {
    try {
      final response = await apiServices.getSmailerBook(category: category);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ApiErrorHandler.fromDioError(e));
      } else {
        return left(ErrorModel(e.toString()));
      }
    }
  }
}
