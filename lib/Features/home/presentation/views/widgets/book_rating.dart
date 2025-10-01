import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      spacing: 6.3,
      children: [
        const Icon(FontAwesomeIcons.solidStar, color: Colors.yellow, size: 14),
        Text(
          '4.9',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const Text('(2390)', style: Styles.textStyle14),
      ],
    );
  }
}
