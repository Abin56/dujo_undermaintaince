// To parse this JSON data, do
//
//     final adminNotice = adminNoticeFromJson(jsonString);

import 'dart:convert';

AdminNoticeModel adminNoticeFromJson(String str) =>
    AdminNoticeModel.fromJson(json.decode(str));

String adminNoticeToJson(AdminNoticeModel data) => json.encode(data.toJson());

class AdminNoticeModel {
  AdminNoticeModel({
    required this.date,
    required this.heading,
    required this.subject,
    required this.topics,
    required this.content,
    required this.signedBy,
    required this.noticeId,
  });

  String date;
  String heading;
  String subject;
  String topics;
  String content;
  String signedBy;
  String noticeId;

  factory AdminNoticeModel.fromJson(Map<String, dynamic> json) =>
      AdminNoticeModel(
        date: json["date"] ?? '',
        heading: json["heading"] ?? '',
        subject: json["subject"] ?? '',
        topics: json["topics"] ?? '',
        content: json["content"] ?? '',
        signedBy: json["signedBy"] ?? '',
        noticeId: json["noticeId"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "heading": heading,
        "subject": subject,
        "topics": topics,
        "content": content,
        "signedBy": signedBy,
        "noticeId": noticeId,
      };
}
