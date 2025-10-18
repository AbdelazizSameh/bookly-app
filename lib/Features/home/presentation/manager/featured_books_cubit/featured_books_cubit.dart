import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;
  int maxResult = 10;
  int startIndex = 0;
  List<BookModel> booksList = [];

  Future<void> fetchFeaturedBooks() async {
    if (startIndex == 0) emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks(
      startIndex: startIndex,
      maxResult: maxResult,
    );
    result.fold(
      (failure) => emit(FeaturedBooksFailure(errMessage: failure.errorMessage)),
      (books) {
        booksList.addAll(books);
        emit(FeaturedBooksSuccess(books: List.from(booksList)));
      },
    );
  }
}
