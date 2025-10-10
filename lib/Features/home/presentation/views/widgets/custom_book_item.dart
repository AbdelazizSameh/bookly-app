import 'package:flutter/material.dart';
import '../../../data/models/book_model/book_model.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 4,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          image: DecorationImage(
            image: NetworkImage(
              book.volumeInfo!.imageLinks!.thumbnail ??
                  'https://uolpress.co.uk/wp-content/uploads/2023/04/book_placeholder.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
