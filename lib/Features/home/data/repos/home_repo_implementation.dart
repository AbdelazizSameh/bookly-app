import '/Features/home/data/models/book_model/book_model.dart';
import '/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '/Features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
