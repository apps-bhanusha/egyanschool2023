// To parse this JSON data, do
//
//     final allContentModal = allContentModalFromJson(jsonString);

import 'dart:convert';

AllContentModal allContentModalFromJson(String str) => AllContentModal.fromJson(json.decode(str));

String allContentModalToJson(AllContentModal data) => json.encode(data.toJson());

class AllContentModal {
    AllContentModal({
        required this.status,
        required this.message,
        required this.response,
    });

    bool status;
    String message;
    List<Response> response;

    factory AllContentModal.fromJson(Map<String, dynamic> json) => AllContentModal(
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
        required this.id,
        required this.title,
        required this.type,
        required this.isPublic,
        required this.file,
        required this.createdBy,
        required this.date,
        this.sessionId,
        this.classId,
        this.clsSecId,
        this.note,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.responseClass,
        this.section,
        this.role,
        this.aa,
    });

    String id;
    String title;
    String type;
    String isPublic;
    String file;
    String createdBy;
    DateTime date;
    dynamic sessionId;
    String? classId;
    String? clsSecId;
    String? note;
    String? isActive;
    DateTime? createdAt;
    dynamic updatedAt;
    String? responseClass;
    String? section;
    String? role;
    String? aa;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        isPublic: json["is_public"],
        file: json["file"],
        createdBy: json["created_by"],
        date: DateTime.parse(json["date"]),
        sessionId: json["session_id"],
        classId: json["class_id"],
        clsSecId: json["cls_sec_id"],
        note: json["note"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        responseClass: json["class"],
        section: json["section"],
        role: json["role"],
        aa: json["aa"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "is_public": isPublic,
        "file": file,
        "created_by": createdBy,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "session_id": sessionId,
        "class_id": classId,
        "cls_sec_id": clsSecId,
        "note": note,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "class": responseClass,
        "section": section,
        "role": role,
        "aa": aa,
    };
}
