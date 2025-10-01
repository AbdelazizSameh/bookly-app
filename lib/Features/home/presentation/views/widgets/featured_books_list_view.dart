import 'package:flutter/material.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) => const CustomBookItem(),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 12),
      ),
    );
  }
}
