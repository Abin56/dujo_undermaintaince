// To parse this JSON data, do
//
//     final studentData = studentDataFromJson(jsonString);

import 'dart:convert';

StudentData studentDataFromJson(String str) =>
    StudentData.fromJson(json.decode(str));

String studentDataToJson(StudentData data) => json.encode(data.toJson());

class StudentData {
  StudentData({
    required this.address,
    required this.admissionNumber,
    required this.bloodGroup,
    required this.gurdianName,
    required this.id,
    required this.joinDate,
    required this.parentName,
    required this.parentPhNo,
    required this.rollNo,
    required this.studentClass,
    required this.studentImage,
    required this.studentName,
    required this.studentemailController,
    required this.wclass,
  });

  String address;
  String admissionNumber;
  String bloodGroup;
  String gurdianName;
  String id;
  DateTime joinDate;
  String parentName;
  String parentPhNo;
  String rollNo;
  String studentClass;
  String studentImage;
  String studentName;
  String studentemailController;
  String wclass;

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        address: json["address"] ?? "",
        admissionNumber: json["admissionNumber"] ?? "",
        bloodGroup: json["bloodGroup"] ?? "",
        gurdianName: json["gurdianName"] ?? "",
        id: json["id"] ?? "",
        joinDate: DateTime.parse(json["joinDate"] ?? ""),
        parentName: json["parentName"] ?? "",
        parentPhNo: json["parentPhNo"] ?? "",
        rollNo: json["rollNo"] ?? "",
        studentClass: json["studentClass"] ?? "",
        studentImage: json["studentImage"] ?? "",
        studentName: json["studentName"] ?? "",
        studentemailController: json["studentemailController"] ?? "",
        wclass: json["wclass"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "admissionNumber": admissionNumber,
        "bloodGroup": bloodGroup,
        "gurdianName": gurdianName,
        "id": id,
        "joinDate": joinDate.toIso8601String(),
        "parentName": parentName,
        "parentPhNo": parentPhNo,
        "rollNo": rollNo,
        "studentClass": studentClass,
        "studentImage": studentImage,
        "studentName": studentName,
        "studentemailController": studentemailController,
        "wclass": wclass,
      };
}
