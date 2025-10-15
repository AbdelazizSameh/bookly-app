import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.153,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 30, right: 12, top: 0),
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) => CustomBookImage(book: BookModel()),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 10),
      ),
    );
  }
}
