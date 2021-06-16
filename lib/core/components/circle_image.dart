import 'package:members/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {

  final double width;
  final double radius;
  final String image;

  const CircleImage({Key key, this.width, this.image, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth((width ?? 60)/315),
      height: context.dynamicWidth((width ?? 60)/315),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(context.dynamicWidth(radius ?? width ?? 50)),
          border: Border.all(color: Colors.grey),
          image: DecorationImage(
              image: AssetImage(image ?? "assets/images/user_image.jpg"),
              fit: BoxFit.fill
          )
      ),
    );
  }
}
