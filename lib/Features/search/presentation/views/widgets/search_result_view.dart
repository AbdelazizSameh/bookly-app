import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/widgets/best_seller_book_item.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key});

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    scrollAndPaginationMethod();
    super.initState();
  }

  void scrollAndPaginationMethod() {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final searchCubit = context.read<SearchBookCubit>();
        searchCubit.searchFreeBooks();
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
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBookSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text('We couldn\'t find any books matching your search.'),
            );
          }
          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              if (index < state.books.length - 1) {
                return BestSellerBookItem(book: state.books[index]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },

            separatorBuilder: (context, index) => const SizedBox(height: 20),
          );
        } else if (state is SearchBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchBookInitial) {
          return const Center(
            child: Text('Discover amazing reads — start typing!'),
          );
        } else {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const BestSellerBookItem(book: BookModel());
            },

            separatorBuilder: (context, index) => const SizedBox(height: 20),
          );
        }
      },
    );
  }
}
