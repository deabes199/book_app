import 'package:book_app/core/networking/api_constant.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseURL)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET(ApiConstant.programming)
  Future<BookModel> getProgrammingBook({
    @Query('startIndex') int page = 0,
  });
  @GET(ApiConstant.newest)
  Future<BookModel> getNewestBook({
    @Query("startIndex") int page = 0,
  });
   @GET(ApiConstant.search)
  Future<BookModel>searchBook(
    {
      @Query('q')required String query,
    }
  );
  @GET(ApiConstant.smailer)
  Future<BookModel>getSmailerBook({
    @Query('q') required String category,
  });
}
