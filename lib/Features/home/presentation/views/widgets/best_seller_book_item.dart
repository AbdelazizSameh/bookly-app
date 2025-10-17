import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/placeholder_horizontal_list_viewitem.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import '/Features/home/data/models/book_model/book_model.dart';
import '/Features/home/presentation/views/widgets/book_rating.dart';
import '/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class BestSellerBookItem extends StatelessWidget {
  const BestSellerBookItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var bookState = BlocProvider.of<NewestBooksCubit>(context).state;

    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(RoutePath.kDetailsView, extra: book),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            bookState is NewestBooksLoading
                ? PlaceholderHorizontalListViewItem()
                : CustomBookImage(book: book),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    book.volumeInfo?.title ?? 'UnKnown',
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGTSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    book.volumeInfo?.authors?[0] ?? 'UnKnown',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      BookRating(model: book),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
