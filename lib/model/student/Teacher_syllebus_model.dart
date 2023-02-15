// To parse this JSON data, do
//
//     final teacherSyllebusModal = teacherSyllebusModalFromJson(jsonString);

import 'dart:convert';

TeacherSyllebusModal teacherSyllebusModalFromJson(String str) => TeacherSyllebusModal.fromJson(json.decode(str));

String teacherSyllebusModalToJson(TeacherSyllebusModal data) => json.encode(data.toJson());

class TeacherSyllebusModal {
    TeacherSyllebusModal({
        required this.status,
        required this.message,
        required this.response,
    });

    bool status;
    String message;
    Response response;

    factory TeacherSyllebusModal.fromJson(Map<String, dynamic> json) => TeacherSyllebusModal(
        status: json["status"],
        message: json["message"],
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "response": response.toJson(),
    };
}

class Response {
    Response({
        required this.title,
        required this.subjectsData,
    });

    String title;
    List<SubjectsDatum> subjectsData;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        title: json["title"],
        subjectsData: List<SubjectsDatum>.from(json["subjects_data"].map((x) => SubjectsDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subjects_data": List<dynamic>.from(subjectsData.map((x) => x.toJson())),
    };
}

class SubjectsDatum {
    SubjectsDatum({
        required this.lebel,
        required this.complete,
        required this.incomplete,
        required this.id,
        required this.total,
        required this.name,
        required this.teacherName,
    });

    String lebel;
    int complete;
    int incomplete;
    String id;
    dynamic total;
    String name;
    String teacherName;

    factory SubjectsDatum.fromJson(Map<String, dynamic> json) => SubjectsDatum(
        lebel: json["lebel"],
        complete: json["complete"],
        incomplete: json["incomplete"],
        id: json["id"],
        total: json["total"],
        name: json["name"],
        teacherName: json["teacher_name"],
    );

    Map<String, dynamic> toJson() => {
        "lebel": lebel,
        "complete": complete,
        "incomplete": incomplete,
        "id": id,
        "total": total,
        "name": name,
        "teacher_name": teacherName,
    };
}
