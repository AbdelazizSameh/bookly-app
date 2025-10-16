import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var book = GoRouter.of(context).state.extra as BookModel;
    return Column(
      children: [
        SizedBox(
          width: screenWidth * 0.4,
          child: CustomBookImage(book: book),
        ),
        const SizedBox(height: 43),
        Text(
          book.volumeInfo?.title ?? "Unknown",
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          book.volumeInfo?.authors?[0] ?? "Unknown",
          textAlign: TextAlign.center,
          style: Styles.textStyle18.copyWith(
            color: const Color(0xffB8B6BD),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 18),
        BookRating(mainAxisAlignment: MainAxisAlignment.center, model: book),
        const SizedBox(height: 37),
        BooksAction(book: book),
      ],
    );
  }
}
