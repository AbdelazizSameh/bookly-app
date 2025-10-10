import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(RoutePath.kDetailsView),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.6 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: book.volumeInfo!.imageLinks!.thumbnail as String,
                  errorWidget: (context, url, error) => const ColoredBox(
                    color: Colors.white38,
                    child: Icon(Icons.image_not_supported_outlined),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Harry Potter and the Goblet of Fire',
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGTSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'J.K. Rowling',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '19.99 €',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const BookRating(),
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
