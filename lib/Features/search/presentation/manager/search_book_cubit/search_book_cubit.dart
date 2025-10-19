import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchRepo) : super(SearchBookInitial());

  final SearchRepo searchRepo;

  int maxResult = 10;
  int startIndex = 0;

  List<BookModel> booksList = [];

  Future<void> searchFreeBooks({
    String intitleString = '',
    bool newSearch = true,
    int? newCategoryStartIndex,
  }) async {
    if (newSearch && newCategoryStartIndex == 0) {
      emit(SearchBookLoading());
      booksList.clear();
      startIndex = 0;
      newCategoryStartIndex = null;
    }

    var result = await searchRepo.searchFreeBooks(
      startIndex: startIndex,
      maxResult: maxResult,
      inTitle: intitleString,
    );

    result.fold(
      (failure) => emit(SearchBookFailure(errMessage: failure.errorMessage)),
      (books) {
        booksList.addAll(books);
        emit(SearchBookSuccess(books: List.from(booksList)));
        startIndex += maxResult;
      },
    );
  }
}
