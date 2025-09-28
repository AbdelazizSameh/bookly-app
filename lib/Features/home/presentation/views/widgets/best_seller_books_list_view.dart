import 'package:flutter/material.dart';
import 'best_seller_book_item.dart';

class BestSellerBooksListView extends StatelessWidget {
  const BestSellerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList.separated(
        itemBuilder: (context, index) => BestSellerBookItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 10,
      ),
    );
  }
}
