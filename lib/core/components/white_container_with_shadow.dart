import 'package:flutter/cupertino.dart';
import 'package:members/core/constants/app_constants.dart';
import 'package:members/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class WhiteContainerWithShadow extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;
  final Color shadowColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget child;

  const WhiteContainerWithShadow(
      {Key key,
      @required this.width,
      @required this.height,
      this.radius,
      this.color,
      this.shadowColor,
      this.padding,
      this.margin,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      width: width ?? context.dynamicWidth(0.8),
      height: height ?? context.dynamicHeight(0.2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? AppConstants.CONTAINER_CORNERS_RADIUS),
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: child ??
          Container(
            color: Colors.white,
          ),
    );
  }
}
