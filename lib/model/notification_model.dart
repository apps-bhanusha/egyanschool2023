// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel? notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel? data) => json.encode(data!.toJson());

class NotificationModel {
    NotificationModel({
        this.status,
        this.message,
        this.response,
    });

    bool? status;
    String? message;
    List<Response?>? response;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        status: json["status"],
        message: json["message"],
        response: json["response"] == null ? [] : List<Response?>.from(json["response"]!.map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x!.toJson())),
    };
}

class Response {
    Response({
        this.notiId,
        this.studentId,
        this.notificationText,
        this.isRead,
        this.createdAt,
        this.sendBy,
    });

    String? notiId;
    String? studentId;
    String? notificationText;
    String? isRead;
    DateTime? createdAt;
    String? sendBy;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        notiId: json["noti_id"],
        studentId: json["student_id"],
        notificationText: json["notification_text"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
        sendBy: json["send_by"],
    );

    Map<String, dynamic> toJson() => {
        "noti_id": notiId,
        "student_id": studentId,
        "notification_text": notificationText,
        "is_read": isRead,
        "created_at": createdAt?.toIso8601String(),
        "send_by": sendBy,
    };
}
