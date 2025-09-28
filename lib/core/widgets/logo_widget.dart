import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.width, this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsData.logo,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
    );
  }
}
