import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_book_item.dart';

class BestSellerBooksListView extends StatelessWidget {
  const BestSellerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
          if (state is NewestBooksSuccess) {
            return SliverList.separated(
              itemBuilder: (context, index) =>
                  BestSellerBookItem(book: state.books[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: state.books.length,
            );
          } else if (state is NewestBooksFailure) {
            return SliverFillRemaining(
              child: CustomErrorWidget(errMessage: state.errMessage),
            );
          } else {
            return SliverFillRemaining(child: const CustomLoadingIndicator());
          }
        },
      ),
    );
  }
}
