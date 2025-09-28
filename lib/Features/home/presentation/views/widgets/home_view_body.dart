import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: 10),
          const FeaturedBooksListView(),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Best Seller', style: Styles.textStyle18),
                BestSellerBookItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerBookItem extends StatelessWidget {
  const BestSellerBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.4 / 4,
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage(AssetsData.test),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // const SizedBox(width: 20),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Text(
          //       'Harry Potter and the Goblet of Fire',
          //       style: Styles.titleMeduim,
          //       maxLines: 2,
          //       overflow: TextOverflow.clip,
          //     ),
          //     Text('Harry Potter and t', maxLines: 1),
          //   ],
          // ),
        ],
      ),
    );
  }
}
