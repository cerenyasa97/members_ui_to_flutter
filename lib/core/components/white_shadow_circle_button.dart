import 'package:members/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class WhiteShadowCircleButton extends StatelessWidget {
  final Function onTap;
  final double width;
  final Widget child;

  const WhiteShadowCircleButton({Key key, this.onTap, this.width, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.dynamicWidth(width ?? 0.065),
        height: context.dynamicWidth(width ?? 0.065),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.dynamicWidth(width ?? 0.065)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
