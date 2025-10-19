import '/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '/Features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks({
    required int startIndex,
    required int maxResult,
  });
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks({
    required int startIndex,
    required int maxResult,
  });
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
    int? startIndex,
    int? maxResult,
  });
}
