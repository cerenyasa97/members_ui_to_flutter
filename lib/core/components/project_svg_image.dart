import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProjectSVGImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const ProjectSVGImage(
      {Key key, @required this.imagePath, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
    );
  }
}
