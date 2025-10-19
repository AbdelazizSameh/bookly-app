import 'dart:math';

import 'package:bookly_app/Features/search/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/styles.dart';
import 'search_result_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(Icons.close),
            ),
            const CustomSearchTextField(),
            const SizedBox(height: 16),
            const Text('Search Result', style: Styles.textStyle18),
            const SizedBox(height: 16),
            BlocSelector<SearchBookCubit, SearchBookState, bool>(
              selector: (state) {
                return state is SearchBookLoading;
              },
              builder: (context, state) {
                return Expanded(
                  child: Skeletonizer(
                    enabled: state,
                    child: const SearchResultListView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
