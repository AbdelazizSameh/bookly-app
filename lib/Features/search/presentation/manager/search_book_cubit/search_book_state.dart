part of 'search_book_cubit.dart';

sealed class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

final class SearchBookInitial extends SearchBookState {}

final class SearchBookLoading extends SearchBookState {}

final class SearchBookFailure extends SearchBookState {
  final String errMessage;

  const SearchBookFailure({required this.errMessage});
}

final class SearchBookSuccess extends SearchBookState {
  final List<BookModel> books;

  const SearchBookSuccess({required this.books});
  @override
  List<Object> get props => [books];
}
