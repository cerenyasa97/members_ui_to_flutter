import 'package:flutter/material.dart';
import 'package:members/core/constants/app_constants.dart';

class AppText extends StatelessWidget {

  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  const AppText({Key key, this.text, this.fontWeight, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Text(
      text,
      style: TextStyle(
        fontSize: (fontSize ?? 15) * textScaleFactor,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: AppConstants.primaryColor
      ),
    );
  }
}
