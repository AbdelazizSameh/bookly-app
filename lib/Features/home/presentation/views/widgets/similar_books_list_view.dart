import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/core/widgets/palceholder_horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.155,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            return ListView.separated(
              padding: EdgeInsets.only(left: 30, right: 12, top: 0),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) =>
                  CustomBookImage(book: state.books[index]),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 10),
            );
          } else if (state is SimilarBooksFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const PlaceholderHorizontalListView(
              padding: EdgeInsets.only(left: 30, right: 12, top: 0),
            );
          }
        },
      ),
    );
  }
}
