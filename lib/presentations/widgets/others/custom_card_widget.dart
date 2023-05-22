import 'package:beauty_skin/configs/size_config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;

  const CustomCardWidget({
    Key? key,
    this.decoration,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: width,
          height: height,
          padding: padding ?? EdgeInsets.all(SizeConfig.defaultPadding),
          decoration: decoration ?? _defaultDecoration(),
          child: child,
        ),
      ),
    );
  }

  _defaultDecoration() {
    return BoxDecoration(
      borderRadius: kBorderRadius10,
      border: Border.all(color: COLOR_CONST.borderColor.withOpacity(0.3)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 1,
          spreadRadius: 1,
          color: COLOR_CONST.cardShadowColor.withOpacity(0.2),
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
