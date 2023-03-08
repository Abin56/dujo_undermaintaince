//     final GetAttendenceModel = GetAttendenceModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

GetAttendenceModel GetAttendenceModelFromJson(String str) =>
    GetAttendenceModel.fromJson(json.decode(str));

String GetAttendenceModelToJson(GetAttendenceModel data) =>
    json.encode(data.toJson());

class GetAttendenceModel {
  GetAttendenceModel({
    required this.id,
    required this.present,
    required this.date,
    required this.studentName,
  });

  String id;
  bool present = true;
  String date;
  String studentName;

  factory GetAttendenceModel.fromJson(Map<String, dynamic> json) =>
      GetAttendenceModel(
        id: json["id"] ?? '',
        present: json["present"] ?? true,
        date: json["date"] ?? '',
        studentName: json["studentName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "present": present,
        "date": date,
        "studentName": studentName,
      };
}

class AddAttendenceStatusToFireBase {
  Future addAttendenceStatusController(GetAttendenceModel productModel, context,
      schoolid, classId, formatter, studentName, status) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("SchoolListCollection")
          .doc(schoolid)
          .collection("Classes")
          .doc(classId)
          .collection("Attendence")
          .doc(formatter)
          .collection(status)
          .doc(studentName)
          .set(productModel.toJson());
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
