import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:members/model/group_model.dart';

class ApiService extends ChangeNotifier{
  final String dummyDataPath = "assets/data/dummy_data.json";

  List<Group> groupList = [];

  getLocalJsonData() async {
    var dummyData = await rootBundle.loadString(dummyDataPath);
    List<dynamic> decodedJson = json.decode(dummyData);
    decodedJson.forEach((element) => groupList.add(
        Group.fromMap(element["group-${decodedJson.indexOf(element) + 1}"])));
    notifyListeners();
  }
}
