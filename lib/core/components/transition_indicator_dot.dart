import 'package:flutter/material.dart';
import 'package:members/core/constants/app_constants.dart';
import 'package:members/core/extensions/context_extension.dart';

/*
 PageView widgetında sayfa geçişlerini göstermek için aktif olmayan indeksde genişliği fazla,
 diğer indekslerde ise yuvarlak bir container döndürür.

 Örnek:
 ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);
 Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _offersList.length,
            (index) => ValueListenableBuilder(
              valueListenable: _pageIndex,
              builder: (context, value, child) => TransitionIndicatorDot(
                currentPageIndex: value,
                currentContainerIndex: index,
              ),
            ),
          ),
        ),
*/
class TransitionIndicatorDot extends StatelessWidget {
  final int currentPageIndex;
  final int currentContainerIndex;
  final Duration duration;
  final double radius;

  TransitionIndicatorDot(
      {Key key,
      @required this.currentPageIndex,
      @required this.currentContainerIndex,
      this.radius = 8,
      this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration ?? Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: currentPageIndex == currentContainerIndex
          ? 7
          : 30,
      height: 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.dynamicWidth(radius / 412)),
        color: currentPageIndex == currentContainerIndex
            ? AppConstants.secondaryPrimaryColor
            : AppConstants.primaryColor,
      ),
    );
  }
}
