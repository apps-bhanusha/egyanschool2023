// To parse this JSON data, do
//
//     final teacherHomeWorkForEvaluationModel = teacherHomeWorkForEvaluationModelFromJson(jsonString);

import 'dart:convert';

TeacherHomeWorkForEvaluationModel teacherHomeWorkForEvaluationModelFromJson(String str) => TeacherHomeWorkForEvaluationModel.fromJson(json.decode(str));

String teacherHomeWorkForEvaluationModelToJson(TeacherHomeWorkForEvaluationModel data) => json.encode(data.toJson());

class TeacherHomeWorkForEvaluationModel {
  TeacherHomeWorkForEvaluationModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  List<Response> response;

  factory TeacherHomeWorkForEvaluationModel.fromJson(Map<String, dynamic> json) => TeacherHomeWorkForEvaluationModel(
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
    required this.classId,
    required this.sectionId,
    required this.homeworkDate,
    required this.submissionDate,
    required this.description,
    required this.document,
    required this.studentId,
    required this.studentName,
    required this.subjectGroupSubjectId,
    required this.submitDate,
    required this.file,
    required this.responseClass,
    required this.section,
    required this.subjectId,
    required this.subjectName,
  });

  String id;
  String classId;
  String sectionId;
  DateTime homeworkDate;
  DateTime submissionDate;
  String description;
  String document;
  String studentId;
  String studentName;
  String subjectGroupSubjectId;
  DateTime submitDate;
  String file;
  String responseClass;
  String section;
  String subjectId;
  String subjectName;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    classId: json["class_id"],
    sectionId: json["section_id"],
    homeworkDate: DateTime.parse(json["homework_date"]),
    submissionDate: DateTime.parse(json["submission_date"]),
    description: json["description"],
    document: json["document"],
    studentId: json["student_id"],
    studentName: json["student_name"],
    subjectGroupSubjectId: json["subject_group_subject_id"],
    submitDate: DateTime.parse(json["submit_date"]),
    file: json["file"],
    responseClass: json["class"],
    section: json["section"],
    subjectId: json["subject_id"],
    subjectName: json["subject_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "class_id": classId,
    "section_id": sectionId,
    "homework_date": "${homeworkDate.year.toString().padLeft(4, '0')}-${homeworkDate.month.toString().padLeft(2, '0')}-${homeworkDate.day.toString().padLeft(2, '0')}",
    "submission_date": "${submissionDate.year.toString().padLeft(4, '0')}-${submissionDate.month.toString().padLeft(2, '0')}-${submissionDate.day.toString().padLeft(2, '0')}",
    "description": description,
    "document": document,
    "student_id": studentId,
    "student_name": studentName,
    "subject_group_subject_id": subjectGroupSubjectId,
    "submit_date": "${submitDate.year.toString().padLeft(4, '0')}-${submitDate.month.toString().padLeft(2, '0')}-${submitDate.day.toString().padLeft(2, '0')}",
    "file": file,
    "class": responseClass,
    "section": section,
    "subject_id": subjectId,
    "subject_name": subjectName,
  };
}
