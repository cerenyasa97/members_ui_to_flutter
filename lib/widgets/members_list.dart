import 'package:flutter/material.dart';
import 'package:members/core/components/white_container_with_shadow.dart';
import 'package:members/core/constants/app_constants.dart';
import 'package:members/model/group_model.dart';
import 'package:members/utils/api_service.dart';
import 'package:members/widgets/user_card_design.dart';
import 'package:provider/provider.dart';
import 'package:members/core/extensions/context_extension.dart';

class MembersList extends StatelessWidget {
  final List<Member> memberList;

  const MembersList({Key key, this.memberList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(
      builder: (context, snapshot, child) {
        return Container(
          height: context.dynamicHeight(0.50),
            child: ListView.builder(
              padding: EdgeInsets.zero,
          itemBuilder: (context, index) => UserCardDesign(member: memberList[index]),
          itemCount: memberList.length,
        ));
      },
    );
  }
}
