import 'package:flutter/material.dart';
import 'placeholder_asset_widget.dart';

class PlaceholderHorizontalListViewItem extends StatelessWidget {
  const PlaceholderHorizontalListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.45 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: const PlaceholderAssetWidget(),
      ),
    );
  }
}
