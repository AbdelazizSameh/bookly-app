import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> searchFreeBooks({
    required String inTitle,
    int? startIndex,
    int? maxResult,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=intitle:$inTitle&&Filtering=free-ebooks&startIndex=$startIndex&maxResults=$maxResult',
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
}
