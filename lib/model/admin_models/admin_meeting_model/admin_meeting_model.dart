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
    required this.heading,
    required this.categoryOfMeeting,
    required this.membersToBeExpected,
    required this.specialGuest,
    required this.time,
    required this.venue,
    required this.meetingId,
  });

  String date;
  String heading;
  String categoryOfMeeting;
  String membersToBeExpected;
  String specialGuest;
  String time;
  String venue;
  String meetingId;

  factory AdminMeetingModel.fromJson(Map<String, dynamic> json) =>
      AdminMeetingModel(
        date: json["date"],
        heading: json["heading"],
        categoryOfMeeting: json["categoryOfMeeting"],
        membersToBeExpected: json["membersToBeExpected"],
        specialGuest: json["specialGuest"],
        time: json["time"],
        venue: json["venue"],
        meetingId: json["meetingId"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "heading": heading,
        "categoryOfMeeting": categoryOfMeeting,
        "membersToBeExpected": membersToBeExpected,
        "specialGuest": specialGuest,
        "time": time,
        "venue": venue,
        "meetingId": meetingId,
      };
}
