import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const CustomAppBar(), const CustomItem()],
      ),
    );
  }
}
