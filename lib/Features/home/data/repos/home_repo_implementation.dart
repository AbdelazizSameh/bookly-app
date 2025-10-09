import 'package:dio/dio.dart';
import '/core/utils/api_service.dart';
import '/Features/home/data/models/book_model/book_model.dart';
import '/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '/Features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;
  HomeRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest',
      );
      List<BookModel> booksList = [];

      for (var item in data['items']) {
        var model = BookModel.fromJson(item);
        booksList.add(model);
      }

      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
