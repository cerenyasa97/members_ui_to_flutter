import 'package:flutter/material.dart';
import 'package:members/core/components/app_text.dart';
import 'package:members/core/components/circle_image.dart';
import 'package:members/core/components/transition_indicator_dot.dart';
import 'package:members/core/extensions/context_extension.dart';
import 'package:members/core/components/white_container_with_shadow.dart';
import 'package:members/model/group_model.dart';
import 'package:members/utils/api_service.dart';
import 'package:provider/provider.dart';

class GroupsPageView extends StatefulWidget {

  final Function(int) onTap;

  const GroupsPageView({Key key, this.onTap}) : super(key: key);

  @override
  _GroupsPageViewState createState() => _GroupsPageViewState();
}

class _GroupsPageViewState extends State<GroupsPageView> {
  ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(
      builder: (context, snapshot, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WhiteContainerWithShadow(
              width: context.dynamicWidth(0.95),
              height: context.dynamicHeight(0.07),
              child: PageView(
                controller: pageController,
                onPageChanged: (page) => _pageIndex.value = page,
                children: List.generate(
                    (snapshot.groupList.length / 3).ceil(),
                        (index) => Row(
                      children: [
                        groupWidget(snapshot.groupList[3 * index], 3 * index),
                        groupWidget(snapshot.groupList[(3 * index) + 1], (3 * index) + 1),
                        groupWidget(snapshot.groupList[(3 * index) + 2], (3 * index) + 2),
                      ],
                    )),
              )),
          context.mediumHeightSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (snapshot.groupList.length / 3).ceil(),
                  (index) => ValueListenableBuilder(
                valueListenable: _pageIndex,
                builder: (context, value, child) => TransitionIndicatorDot(
                  currentPageIndex: value,
                  currentContainerIndex: index,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget groupWidget(Group data, int index) {
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Container(
        width: context.dynamicWidth(0.31),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleImage(
              image: data.photo,
              width: 30,
            ),
            context.lowWidthSizedBox,
            AppText(
              text: data.name,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
