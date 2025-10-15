import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'books_details_section.dart';
import 'similar_books_section.dart';

class BooksDetailsViewBody extends StatelessWidget {
  const BooksDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const BookDetailsSection(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: const Expanded(child: SizedBox(height: 50)),
          ),
          SliverToBoxAdapter(child: const SimilarBooksSection()),
        ],
      ),
    );
  }
}
