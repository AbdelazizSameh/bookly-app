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
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks({
    required int startIndex,
    required int maxResult,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=Programming&startIndex=$startIndex&maxResults=$maxResult',
      );
      List<BookModel> booksList = (data['items'] as List)
          .map((e) => BookModel.fromJson(e))
          .toList();

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
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks({
    required int startIndex,
    required int maxResult,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=anime&startIndex=$startIndex&maxResults=$maxResult',
      );
      List<BookModel> booksList = (data['items'] as List)
          .map((e) => BookModel.fromJson(e))
          .toList();

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
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
     int? startIndex,
     int? maxResult,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Sorting=relevance&Filtering=free-ebooks&q=$category&startIndex=$startIndex&maxResults=$maxResult',
      );
      List<BookModel> booksList = (data['items'] as List).map((e) {
        return BookModel.fromJson(e);
      }).toList();

      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
