import 'package:flutter/material.dart';
import 'package:members/core/constants/app_constants.dart';
import 'package:members/screens/home_page/home_page.dart';
import 'package:members/utils/api_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppConstants.primaryColor,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ApiService(),
        child: HomePage(),
      ),
    );
  }
}

