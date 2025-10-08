import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/logo_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LogoWidget(width: 75.0, height: 16.1),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(RoutePath.kSearchView);
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
    );
  }
}
