import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  int maxResult = 10;
  int startIndex = 0;
  List<BookModel> booksList = [];

  Future<void> fetchSimilarBooks({required String category}) async {
    if (startIndex == 0) emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(
      category: category,
      startIndex: startIndex,
      maxResult: maxResult,
    );
    result.fold(
      (failure) => emit(SimilarBooksFailure(errMessage: failure.errorMessage)),
      (books) {
        booksList.addAll(books);
        emit(SimilarBooksSuccess(books: List.from(booksList)));
        startIndex += maxResult;
      },
    );
  }
}
