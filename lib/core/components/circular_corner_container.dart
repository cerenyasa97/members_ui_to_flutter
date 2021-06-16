import 'package:members/core/constants/app_constants.dart';
import 'package:members/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CircularCornerContainer extends StatelessWidget {

  final Widget child;
  final double height;
  final double width;
  final double radius;

  const CircularCornerContainer({Key key, @required this.child, this.height, this.width, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      height: height ?? (width ?? context.dynamicHeight(140)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.dynamicHeight(radius ?? 30)),
        color: AppConstants.primaryColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(child: child ?? Container(color: Colors.white,)),
    );
  }
}
