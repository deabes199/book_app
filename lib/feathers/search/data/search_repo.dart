import 'package:book_app/core/networking/api_error_handler.dart';
import 'package:book_app/core/networking/api_services.dart';
import 'package:book_app/core/networking/error_model.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepo {
  final ApiServices apiServices;

  SearchRepo(this.apiServices);


 Future<Either<ErrorModel, BookModel>> searchBooks({required String query}) async {
  try {
    final response = await apiServices.searchBook(query: query);
    return right(response);
  }  catch (error) {
      if (error is DioException) {
        return left(ApiErrorHandler.fromDioError(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
   
  }
}

}
