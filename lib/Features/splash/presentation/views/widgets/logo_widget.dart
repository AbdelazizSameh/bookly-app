import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsData.logo,
      width: 250,
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
    );
  }
}
