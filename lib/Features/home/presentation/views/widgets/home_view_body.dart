import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_books_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
        final newestCubit = context.read<NewestBooksCubit>();
        newestCubit.fetchNewestBooks();
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
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                BlocSelector<FeaturedBooksCubit, FeaturedBooksState, bool>(
                  selector: (state) => state is FeaturedBooksLoading,
                  builder: (context, isLoading) {
                    return Skeletonizer(
                      enabled: isLoading,
                      child: const FeaturedBooksListView(),
                    );
                  },
                ),
                const SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Newest books', style: Styles.textStyle18),
                ),
                const SizedBox(height: 21),
              ],
            ),
          ),
          BlocSelector<NewestBooksCubit, NewestBooksState, bool>(
            selector: (state) => state is NewestBooksLoading,
            builder: (context, isLoading) {
              return Skeletonizer.sliver(
                enabled: isLoading,
                child: const BestSellerBooksListView(),
              );
            },
          ),
        ],
      ),
    );
  }
}
