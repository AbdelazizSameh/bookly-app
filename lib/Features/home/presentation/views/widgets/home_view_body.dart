import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_books_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                BlocSelector<FeaturedBooksCubit, FeaturedBooksState, bool>(
                  selector: (state) => state is FeaturedBooksSuccess,
                  builder: (context, state) {
                    return Skeletonizer(
                      enabled: !state,
                      child: const FeaturedBooksListView(),
                    );
                  },
                ),
                const SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Best Seller', style: Styles.textStyle18),
                ),
                const SizedBox(height: 21),
              ],
            ),
          ),
          BlocSelector<NewestBooksCubit, NewestBooksState, bool>(
            selector: (state) => state is NewestBooksSuccess,
            builder: (context, state) {
              return Skeletonizer.sliver(
                enabled: !state,
                child: const BestSellerBooksListView(),
              );
            },
          ),
        ],
      ),
    );
  }
}
