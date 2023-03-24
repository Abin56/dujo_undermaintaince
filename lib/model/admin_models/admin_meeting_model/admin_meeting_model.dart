// To parse this JSON data, do
//
//     final adminMeetingModel = adminMeetingModelFromJson(jsonString);

import 'dart:convert';

AdminMeetingModel adminMeetingModelFromJson(String str) =>
    AdminMeetingModel.fromJson(json.decode(str));

String adminMeetingModelToJson(AdminMeetingModel data) =>
    json.encode(data.toJson());

class AdminMeetingModel {
  AdminMeetingModel({
    required this.date,
    required this.time,
    required this.subject,
    required this.conductedBy,
    required this.chiefGuest,
    required this.meetingId,
  });

  String date;
  String time;
  String subject;
  String conductedBy;
  String chiefGuest;

  String meetingId;

  factory AdminMeetingModel.fromJson(Map<String, dynamic> json) =>
      AdminMeetingModel(
        date: json["date"],
        time: json["time"],
        subject: json["subject"],
        conductedBy: json["conductedBy"],
        chiefGuest: json["chiefGuest"],
        meetingId: json["meetingId"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "subject": subject,
        "conductedBy": conductedBy,
        "chiefGuest": chiefGuest,
        "meetingId": meetingId,
      };
}
