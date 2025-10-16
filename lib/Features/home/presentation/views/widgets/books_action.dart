import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/functions/custom_url_launcher.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Row(
        children: [
          CustomButton(
            onTap: () {},
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
          ),
          CustomButton(
            onTap: () =>
                customUrlLauncher(context, book.volumeInfo!.previewLink),
            text: 'Free preview',
            fontSize: 16,
            textColor: Colors.white,
            backgroundColor: const Color(0xffEF8262),
            borderRadius: BorderRadiusGeometry.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
