import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/palceholder_horizontal_list_view.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
        var featuredCubit = context.read<FeaturedBooksCubit>();
        featuredCubit.startIndex += featuredCubit.maxResult;
        featuredCubit.fetchFeaturedBooks();
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
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                if (index < state.books.length - 1) {
                  return CustomBookImage(book: state.books[index]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },

              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 12),
            );
          } else if (state is FeaturedBooksFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const PlaceholderHorizontalListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
            );
          }
        },
      ),
    );
  }
}
