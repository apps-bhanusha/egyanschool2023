// To parse this JSON data, do
//
//     final studentListModel = studentListModelFromJson(jsonString);

import 'dart:convert';

StudentListModel studentListModelFromJson(String str) => StudentListModel.fromJson(json.decode(str));

String studentListModelToJson(StudentListModel data) => json.encode(data.toJson());

class StudentListModel {
    StudentListModel({
        required this.status,
        required this.response,
    });

    bool status;
    List<Response> response;

    factory StudentListModel.fromJson(Map<String, dynamic> json) => StudentListModel(
        status: json["status"],
        response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Response {
    Response({
        required this.studentSessionId,
        required this.studentId,
        required this.studentName,
    });

    String studentSessionId;
    String studentId;
    String studentName;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        studentSessionId: json["student_session_id"],
        studentId: json["student_id"],
        studentName: json["student_name"],
    );

    Map<String, dynamic> toJson() => {
        "student_session_id": studentSessionId,
        "student_id": studentId,
        "student_name": studentName,
    };
}
