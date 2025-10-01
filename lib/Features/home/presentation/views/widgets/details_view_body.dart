import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'custom_book_item.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          SizedBox(width: screenWidth * 0.38, child: CustomBookItem()),
        ],
      ),
    );
  }
}
