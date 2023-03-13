import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

GuardianModel GuardianModelFromJson(String str) =>
    GuardianModel.fromJson(json.decode(str));

String GuardianModelToJson(GuardianModel data) =>
    json.encode(data.toJson());

class GuardianModel {
  GuardianModel({
    required this.id,
    required this.guardianName, 
    required this.studentID,
    required this.classIncharge,
    required this.guardianID,
    required this.joinDate,
  });

  String guardianName;
  String classIncharge;
  String studentID;
  String id;
  String guardianID;
  String joinDate;

  factory GuardianModel.fromJson(Map<String, dynamic> json) =>
      GuardianModel(
        id: json["id"] ?? '',
        studentID: json["studentID"] ?? '',
        guardianName: json["guardianName"] ?? '',
        classIncharge: json["classIncharge"] ?? '',
        joinDate: json["joinDate"] ?? '',
        guardianID: json["guardianID"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guardianName": guardianName, 
        "studentID": studentID,
        "classIncharge": classIncharge,
        "guardianID": guardianID,
        "joinDate": joinDate,
      };
}

class CreateGuardiansAddToFireBase {
  Future createSchoolController(
      GuardianModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Student_Guardian")
          .doc(productModel.guardianID)
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