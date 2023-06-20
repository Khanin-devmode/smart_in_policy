import 'package:flutter/material.dart';

class Client {
  Client(this.firstName, this.lastName, this.nickName, this.dateOfBirth,
      this.age, this.martialStatus);
  String firstName;
  String lastName;
  String nickName;
  DateTime dateOfBirth;
  int age;
  String martialStatus;
  int? id;
  String? creatdBy;

  Map<String, dynamic> toCollectionObj() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'nickName': nickName,
      'dateOfBirth': dateOfBirth,
      'age': age,
      'martialStaus': martialStatus,
    };
  }
}

enum MartialStatus { single, married, divorce }
