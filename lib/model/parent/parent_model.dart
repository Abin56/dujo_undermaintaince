import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

ParentModel ParentModelFromJson(String str) =>
    ParentModel.fromJson(json.decode(str));

String ParentModelToJson(ParentModel data) =>
    json.encode(data.toJson());

class ParentModel {
  ParentModel({
    required this.id,
    required this.parentName, 
    required this.studentID,
    required this.classIncharge,
    required this.parentID,
    required this.joinDate,
  });

  String parentName;
  String classIncharge;
  String studentID;
  String id;
  String parentID;
  String joinDate;

  factory ParentModel.fromJson(Map<String, dynamic> json) =>
      ParentModel(
        id: json["id"] ?? '',
        studentID: json["studentID"] ?? '',
        parentName: json["parentName"] ?? '',
        classIncharge: json["classIncharge"] ?? '',
        joinDate: json["joinDate"] ?? '',
        parentID: json["parentID"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parentName": parentName, 
        "studentID": studentID,
        "classIncharge": classIncharge,
        "parentID": parentID,
        "joinDate": joinDate,
      };
}

class CreateParentsAddToFireBase {
  Future createSchoolController(
      ParentModel productModel, context, id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(id)
          .collection("Students_Parents")
          .doc(productModel.parentID)
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