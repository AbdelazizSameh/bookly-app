import 'package:flutter/material.dart';
import '../utils/assets.dart';

class PlaceholderAssetWidget extends StatelessWidget {
  const PlaceholderAssetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsData.placeholderAsset, fit: BoxFit.fill);
  }
}
