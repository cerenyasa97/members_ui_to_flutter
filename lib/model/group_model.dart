// To parse this JSON data, do
//
//     final members = membersFromMap(jsonString);

import 'dart:convert';

List<DummyData> dummyDataFromMap(String str) => List<DummyData>.from(json.decode(str).map((x) => DummyData.fromMap(x)));

String dummyDataToMap(List<DummyData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DummyData {
  DummyData({
    this.group1,
    this.group2,
    this.group3,
    this.group4,
    this.group5,
    this.group6,
  });

  Group group1;
  Group group2;
  Group group3;
  Group group4;
  Group group5;
  Group group6;

  factory DummyData.fromMap(Map<String, dynamic> json) => DummyData(
    group1: json["group-1"] == null ? null : Group.fromMap(json["group-1"]),
    group2: json["group-2"] == null ? null : Group.fromMap(json["group-2"]),
    group3: json["group-3"] == null ? null : Group.fromMap(json["group-3"]),
    group4: json["group-4"] == null ? null : Group.fromMap(json["group-4"]),
    group5: json["group-5"] == null ? null : Group.fromMap(json["group-5"]),
    group6: json["group-6"] == null ? null : Group.fromMap(json["group-6"]),
  );

  Map<String, dynamic> toMap() => {
    "group-1": group1 == null ? null : group1.toMap(),
    "group-2": group2 == null ? null : group2.toMap(),
    "group-3": group3 == null ? null : group3.toMap(),
    "group-4": group4 == null ? null : group4.toMap(),
    "group-5": group5 == null ? null : group5.toMap(),
    "group-6": group6 == null ? null : group6.toMap(),
  };
}

class Group {
  Group({
    this.name,
    this.photo,
    this.members,
  });

  String name;
  String photo;
  List<Member> members;

  factory Group.fromMap(Map<String, dynamic> json) => Group(
    name: json["name"],
    photo: json["photo"],
    members: List<Member>.from(json["members"].map((x) => Member.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "photo": photo,
    "members": List<dynamic>.from(members.map((x) => x.toMap())),
  };

  @override
  String toString() {
    return 'Group{name: $name, photo: $photo, members: $members}';
  }
}

class Member {
  Member({
    this.id,
    this.userName,
    this.userImage,
    this.jobDescription,
    this.phoneNumber,
    this.actions,
  });

  String id;
  String userName;
  String userImage;
  String jobDescription;
  String phoneNumber;
  List<String> actions;

  factory Member.fromMap(Map<String, dynamic> json) => Member(
    id: json["id"],
    userName: json["user_name"],
    userImage: json["user_image"],
    jobDescription: json["job_description"],
    phoneNumber: json["phone_number"],
    actions: List<String>.from(json["actions"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_name": userName,
    "user_image": userImage,
    "job_description": jobDescription,
    "phone_number": phoneNumber,
    "actions": List<dynamic>.from(actions.map((x) => x)),
  };

  @override
  String toString() {
    return 'Member{id: $id, userName: $userName, userImage: $userImage, jobDescription: $jobDescription, phoneNumber: $phoneNumber, actions: $actions}';
  }
}
