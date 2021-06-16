import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double dynamicHeight(double factor) => factor * this.height;

  double dynamicWidth(double factor) => factor * this.width;

  SizedBox get lowWidthSizedBox => SizedBox(
    width: this.dynamicWidth(0.01),
  );
  SizedBox get mediumWidthSizedBox => SizedBox(
        width: this.dynamicWidth(0.067),
      );

  SizedBox get lowHeightSizedBox => SizedBox(
    height: this.dynamicHeight(0.01),
  );
  SizedBox get mediumHeightSizedBox => SizedBox(
    height: this.dynamicHeight(0.02),
  );

  EdgeInsets get pageEdgeInsets => EdgeInsets.only(
      top: this.dynamicHeight(0.12),
      right: this.dynamicWidth(0.027),
      left: this.dynamicWidth(0.027),
      bottom: this.dynamicHeight(0.070));

  EdgeInsets get cardMargin => EdgeInsets.symmetric(vertical: this.dynamicHeight(0.007));
}
