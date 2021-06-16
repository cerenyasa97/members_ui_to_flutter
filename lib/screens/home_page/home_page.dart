import 'package:flutter/material.dart';
import 'package:members/core/components/circular_corner_container.dart';
import 'package:members/core/constants/app_constants.dart';
import 'package:members/core/extensions/context_extension.dart';
import 'package:members/utils/api_service.dart';
import 'package:provider/provider.dart';

import 'home_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: AppConstants.backgroundColor,
        body: Container(
          width: context.width,
          height: context.height,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                width: context.dynamicWidth(0.16),
                height: context.dynamicHeight(0.12),
                decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(context.dynamicWidth(0.053)),
                        bottomRight:
                            Radius.circular(context.dynamicWidth(0.053)))),
              )),
              Positioned(
                  top: context.dynamicHeight(0.05),
                  right: context.dynamicWidth(0.067),
                  child: CircularCornerContainer(
                    width: context.dynamicWidth(0.08),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                bottom: context.dynamicHeight(0.02),
                  child: Container(
                    width: context.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    CircularCornerContainer(
                      width: context.dynamicWidth(0.045),
                        child: Icon(
                      Icons.arrow_back_ios,
                          size: 12,
                      color: Colors.white,
                    )),
                    context.mediumWidthSizedBox,
                    CircularCornerContainer(
                        width: context.dynamicWidth(0.045),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.white,
                        ))
                ],
              ),
                  )),
              HomePageContent()
            ],
          ),
        ));
  }

  void getData() {
    Provider.of<ApiService>(context, listen: false).getLocalJsonData();
  }
}
