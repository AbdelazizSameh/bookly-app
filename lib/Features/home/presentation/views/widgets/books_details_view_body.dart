import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';
import 'similar_books_list_view.dart';

class BooksDetailsViewBody extends StatelessWidget {
  const BooksDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          SizedBox(width: screenWidth * 0.38, child: const CustomBookItem()),
          const SizedBox(height: 43),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              color: const Color(0xffB8B6BD),
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 18),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(height: 37),
          const BooksAction(),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'You can also like',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 18),
          const SimilarBooksListView(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
