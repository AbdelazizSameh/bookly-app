import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          margin: const EdgeInsets.only(top: 12, left: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            image: const DecorationImage(
              image: AssetImage(AssetsData.test),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
