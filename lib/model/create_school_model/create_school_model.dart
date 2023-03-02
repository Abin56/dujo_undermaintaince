//     final CreatedSchoolAddModel = CreatedSchoolAddModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

CreatedSchoolAddModel CreatedSchoolAddModelFromJson(String str) =>
    CreatedSchoolAddModel.fromJson(json.decode(str));

String CreatedSchoolAddModelToJson(CreatedSchoolAddModel data) =>
    json.encode(data.toJson());

class CreatedSchoolAddModel {
  CreatedSchoolAddModel({
    required this.id,
    required this.schoolName,
    required this.schoolID,
    required this.district,
    required this.place,
    required this.adminUserName,
    required this.password,
    required this.postedDate,
  });

  String schoolName;
  String schoolID;
  String id;
  String district;
  String place;
  String adminUserName;
  String password;
  String postedDate;

  factory CreatedSchoolAddModel.fromJson(Map<String, dynamic> json) =>
      CreatedSchoolAddModel(
        id: json["id"] ?? '',
        schoolName: json["schoolName"] ?? '',
        schoolID: json["schoolID"] ?? '',
        place: json["place"] ?? '',
        district: json["district"] ?? '',
        adminUserName: json["adminUserName"] ?? '',
        password: json["password"] ?? '',
        postedDate: json["postedDate"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "schoolName": schoolName,
        "schoolID": schoolID,
        "district": district,
        "place": place,
        "adminUserName": adminUserName,
        "password": password,
        "postedDate": postedDate,
      };
}

class CreateSchoolAddToFireBase {
  Future createSchoolController(
      CreatedSchoolAddModel productModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(productModel.schoolID)
          .set(productModel.toJson())
          .then(
        (value) {
          return showDialog(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Message'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Successfully created'),
                      Text(
                        'School ID = ${productModel.schoolID}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
