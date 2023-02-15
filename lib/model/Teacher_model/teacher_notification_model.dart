// To parse this JSON data, do
//
//     final teacherNotificationModel = teacherNotificationModelFromJson(jsonString);

import 'dart:convert';

TeacherNotificationModel teacherNotificationModelFromJson(String str) => TeacherNotificationModel.fromJson(json.decode(str));

String teacherNotificationModelToJson(TeacherNotificationModel data) => json.encode(data.toJson());

class TeacherNotificationModel {
  TeacherNotificationModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  List<Response> response;

  factory TeacherNotificationModel.fromJson(Map<String, dynamic> json) => TeacherNotificationModel(
    status: json["status"],
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class Response {
  Response({
    required this.notiId,
    required this.staffId,
    required this.notificationText,
    required this.isRead,
    required this.createdAt,
    required this.sendBy,
  });

  String notiId;
  String staffId;
  String notificationText;
  String isRead;
  DateTime createdAt;
  String sendBy;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    notiId: json["noti_id"],
    staffId: json["staff_id"],
    notificationText: json["notification_text"],
    isRead: json["is_read"],
    createdAt: DateTime.parse(json["created_at"]),
    sendBy: json["send_by"],
  );

  Map<String, dynamic> toJson() => {
    "noti_id": notiId,
    "staff_id": staffId,
    "notification_text": notificationText,
    "is_read": isRead,
    "created_at": createdAt.toIso8601String(),
    "send_by": sendBy,
  };
}
