import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../data/models/book_model/book_model.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: book.volumeInfo!.imageLinks!.thumbnail as String,
          errorWidget: (context, url, error) => const ColoredBox(
            color: Colors.white38,
            child: Icon(Icons.image_not_supported_outlined),
          ),
        ),
      ),
    );
  }
}
