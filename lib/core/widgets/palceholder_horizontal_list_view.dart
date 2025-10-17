import 'package:flutter/material.dart';
import 'placeholder_horizontal_list_viewitem.dart';

class PlaceholderHorizontalListView extends StatelessWidget {
  const PlaceholderHorizontalListView({super.key, this.padding});
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) =>
          const PlaceholderHorizontalListViewItem(),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 10),
    );
  }
}
