import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/core/widgets/palceholder_horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'custom_book_item.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({super.key});

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    scrollAndPaginationMethod();
    super.initState();
  }

  void scrollAndPaginationMethod() {
    var book = GoRouter.of(context).state.extra as BookModel;
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final featuredCubit = context.read<SimilarBooksCubit>();
        featuredCubit.fetchSimilarBooks(
          category: book.volumeInfo?.categories?[0] ?? "programming",
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.155,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            return ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.only(left: 30, right: 12, top: 0),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                if (index < state.books.length - 1) {
                  return CustomBookImage(book: state.books[index]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 10),
            );
          } else if (state is SimilarBooksFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const PlaceholderHorizontalListView(
              padding: EdgeInsets.only(left: 30, right: 12, top: 0),
            );
          }
        },
      ),
    );
  }
}
