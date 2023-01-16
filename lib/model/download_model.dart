// To parse this JSON data, do
//
//     final downloadModel = downloadModelFromJson(jsonString);

import 'dart:convert';

DownloadModel? downloadModelFromJson(String str) => DownloadModel.fromJson(json.decode(str));

String downloadModelToJson(DownloadModel? data) => json.encode(data!.toJson());

class DownloadModel {
    DownloadModel({
        this.status,
        this.message,
        this.response,
    });

    bool? status;
    String? message;
    Response? response;

    factory DownloadModel.fromJson(Map<String, dynamic> json) => DownloadModel(
        status: json["status"],
        message: json["message"],
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "response": response!.toJson(),
    };
}

class Response {
    Response({
        this.titleList,
        this.list,
    });

    String? titleList;
    List<ListElement?>? list;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        titleList: json["title_list"],
        list: json["list"] == null ? [] : List<ListElement?>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title_list": titleList,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x!.toJson())),
    };
}

class ListElement {
    ListElement({
        this.id,
        this.sessionId,
        this.title,
        this.type,
        this.isPublic,
        this.classId,
        this.clsSecId,
        this.file,
        this.createdBy,
        this.note,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.date,
        this.sectionId,
        this.listClass,
        this.section,
    });

    String? id;
    dynamic sessionId;
    String? title;
    String? type;
    String? isPublic;
    String? classId;
    String? clsSecId;
    String? file;
    String? createdBy;
    String? note;
    String? isActive;
    DateTime? createdAt;
    dynamic updatedAt;
    DateTime? date;
    String? sectionId;
    String? listClass;
    String? section;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        sessionId: json["session_id"],
        title: json["title"],
        type: json["type"],
        isPublic: json["is_public"],
        classId: json["class_id"],
        clsSecId: json["cls_sec_id"],
        file: json["file"],
        createdBy: json["created_by"],
        note: json["note"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        date: DateTime.parse(json["date"]),
        sectionId: json["section_id"],
        listClass: json["class"],
        section: json["section"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "session_id": sessionId,
        "title": title,
        "type": type,
        "is_public": isPublic,
        "class_id": classId,
        "cls_sec_id": clsSecId,
        "file": file,
        "created_by": createdBy,
        "note": note,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "section_id": sectionId,
        "class": listClass,
        "section": section,
    };
}
