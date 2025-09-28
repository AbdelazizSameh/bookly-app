import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class FeaturedBookItem extends StatelessWidget {
  const FeaturedBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 4,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          image: const DecorationImage(
            image: AssetImage(AssetsData.test),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
