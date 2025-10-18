import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  int maxResult = 10;
  int startIndex = 0;
  List<BookModel> booksList = [];

  Future<void> fetchNewestBooks() async {
    if (startIndex == 0) emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks(
      startIndex: startIndex,
      maxResult: maxResult,
    );
    result.fold(
      (failure) => emit(NewestBooksFailure(errMessage: failure.errorMessage)),
      (books) {
        booksList.addAll(books);
        emit(NewestBooksSuccess(books: List.from(booksList)));
      },
    );
  }
}
