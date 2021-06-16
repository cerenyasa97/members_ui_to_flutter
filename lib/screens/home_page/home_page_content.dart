import 'package:flutter/cupertino.dart';
import 'package:members/core/components/app_text.dart';
import 'package:members/core/components/white_container_with_shadow.dart';
import 'package:members/core/constants/app_constants.dart';
import 'package:members/core/constants/scroll_widget_behavior.dart';
import 'package:members/core/constants/text_constants.dart';
import 'package:members/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:members/utils/api_service.dart';
import 'package:members/widgets/groups_page_view.dart';
import 'package:members/widgets/members_list.dart';
import 'package:provider/provider.dart';

class HomePageContent extends StatelessWidget {
  HomePageContent({Key key}) : super(key: key);

  int groupIndex = 0;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppConstants.primaryColor),
        borderRadius:
            BorderRadius.circular(AppConstants.CONTAINER_CORNERS_RADIUS));
    return Consumer<ApiService>(builder: (context, snapshot, child) {
      return snapshot == null || snapshot.groupList.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ScrollConfiguration(
        behavior: MyBehavior(),
            child: Container(
                width: double.maxFinite,
                padding: context.pageEdgeInsets,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    WhiteContainerWithShadow(
                      width: context.dynamicWidth(0.48),
                      height: context.dynamicHeight(0.07),
                      child: Center(
                        child: AppText(
                          text: TextConstants.MEMBER_TITLE,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: border,
                        focusedBorder: border,
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppConstants.primaryColor,
                        ),
                      ),
                    ),
                    GroupsPageView(onTap: (index) => groupIndex = index,),
                    MembersList(memberList: snapshot.groupList[groupIndex].members,)
                  ],
                ),
              ),
          );
    });
  }
}