//     final AddStudentsModel = AddStudentsModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

AddStudentsModel AddStudentsModelFromJson(String str) =>
    AddStudentsModel.fromJson(json.decode(str));

String AddStudentsModelToJson(AddStudentsModel data) =>
    json.encode(data.toJson());

class AddStudentsModel {
  AddStudentsModel({
    required this.id,
    required this.studentName,
    required this.wclass,
    required this.admissionNumber,
    required this.parentName,
    required this.parentPhNo,
    required this.joinDate,
  });

  String studentName;
  String wclass;
  String id;
  String admissionNumber;
  String parentName;
  String parentPhNo;
  String joinDate;

  factory AddStudentsModel.fromJson(Map<String, dynamic> json) =>
      AddStudentsModel(
        id: json["id"] ?? '',
        studentName: json["studentName"] ?? '',
        wclass: json["wclass"] ?? '',
        joinDate: json["joinDate"] ?? '',
        admissionNumber: json["admissionNumber"] ?? '',
        parentName: json["parentName"] ?? '',
        parentPhNo: json["parentPhNo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "studentName": studentName,
        "wclass": wclass,
        "admissionNumber": admissionNumber,
        "parentName": parentName,
        "parentPhNo": parentPhNo,
        "joinDate": joinDate,
      };
}

class AddStudentsToFireBase {
  Future addStudentsController(
      AddStudentsModel productModel, context, schoolid, classId) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(schoolid)
          .collection("Classes")
          .doc(classId)
          .collection(classId)
          .doc(productModel.admissionNumber)
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
