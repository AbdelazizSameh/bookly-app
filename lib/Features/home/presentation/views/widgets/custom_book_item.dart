import 'package:bookly_app/core/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/book_model/book_model.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(RoutePath.kDetailsView, extra: book),
      child: AspectRatio(
        aspectRatio: 2.45 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
            errorWidget: (context, url, error) => const ColoredBox(
              color: Colors.white38,
              child: Icon(Icons.image_not_supported_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
