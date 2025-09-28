import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Colors.yellow, size: 15),
        Text(
          '4.9',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        Text('(2390)', style: Styles.textStyle14),
      ],
    );
  }
}
