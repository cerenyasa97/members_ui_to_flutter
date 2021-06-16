import 'package:flutter/material.dart';
import 'package:members/core/components/app_text.dart';
import 'package:members/core/components/project_svg_image.dart';
import 'package:members/core/components/white_shadow_circle_button.dart';
import 'package:members/core/constants/app_constants.dart';
import 'package:members/core/constants/image_constants.dart';
import 'package:members/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:members/core/components/white_container_with_shadow.dart';
import 'package:members/model/group_model.dart';

class UserCardDesign extends StatefulWidget {
  final Member member;

  const UserCardDesign({Key key, this.member}) : super(key: key);

  @override
  _UserCardDesignState createState() => _UserCardDesignState();
}

class _UserCardDesignState extends State<UserCardDesign> {
  @override
  Widget build(BuildContext context) {
    return WhiteContainerWithShadow(
      margin: context.cardMargin,
      width: context.dynamicWidth(0.96),
      height: context.dynamicHeight(0.11),
      child: Center(
        child: ListTile(
          leading: leading,
          title: AppText(
            text: widget.member.userName,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          subtitle: subtitle,
          trailing: trailing,
        ),
      ),
    );
  }

  Container get leading => Container(
        width: context.dynamicWidth(0.154),
        height: context.dynamicHeight(0.1),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: AppConstants.primaryColor,
              ),
            ),
            Positioned(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  widget.member.userImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              left: 5,
            ),
          ],
        ),
      );

  Column get subtitle => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: widget.member.jobDescription,
            fontSize: 12,
          ),
          context.lowHeightSizedBox,
          Row(
            children: [
              Container(
                width: context.dynamicWidth(0.06),
                height: context.dynamicHeight(0.025),
                decoration: BoxDecoration(
                    color: AppConstants.thirdPrimaryColor,
                    borderRadius: BorderRadius.circular(
                        AppConstants.TINY_CONTAINER_CORNER_RADIUS)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 10,
                    ),
                    Transform.rotate(
                      angle: 80,
                      child: Icon(
                        Icons.call_end_sharp,
                        color: Colors.white,
                        size: 10,
                      ),
                    )
                  ],
                ),
              ),
              context.lowWidthSizedBox,
              AppText(
                text: widget.member.phoneNumber,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              )
            ],
          )
        ],
      );

  Column get trailing => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            child: WhiteShadowCircleButton(
              onTap: () {},
              child: ProjectSVGImage(imagePath: ImageConstants.MESSAGE_IMAGE),
            ),
            visible: widget.member.actions.contains("message"),
          ),
          Visibility(
            child: widget.member.actions.contains("block_user")
                ? GestureDetector(
                    child: ProjectSVGImage(
                      imagePath: ImageConstants.BANNED_USER_IMAGE,
                    ),
                  )
                : WhiteShadowCircleButton(
                    onTap: () {},
                    child:
                        ProjectSVGImage(imagePath: ImageConstants.EDIT_IMAGE),
                  ),
            visible: (widget.member.actions.contains("block_user") ||
                widget.member.actions.contains("edit")),
          )
        ],
      );
}
