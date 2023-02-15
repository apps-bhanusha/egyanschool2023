// To parse this JSON data, do
//
//     final classSubjectModel = classSubjectModelFromJson(jsonString);

import 'dart:convert';

ClassSubjectModel classSubjectModelFromJson(String str) =>
    ClassSubjectModel.fromJson(json.decode(str));

String classSubjectModelToJson(ClassSubjectModel data) =>
    json.encode(data.toJson());

class ClassSubjectModel {
  ClassSubjectModel({
    required this.status,
    required this.response,
  });

  bool status;
  List<Response> response;

  factory ClassSubjectModel.fromJson(Map<String, dynamic> json) =>
      ClassSubjectModel(
        status: json["status"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class Response {
  Response({
    required this.subjectGroupSubjectsId,
    required this.subjectId,
    required this.name,
    required this.type,
    this.theorySubjectId,
  });

  String subjectGroupSubjectsId;
  String subjectId;
  String name;
  String type;
  dynamic theorySubjectId;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    subjectGroupSubjectsId: json["subject_group_subjects_id"],
    subjectId: json["subject_id"],
    name: json["name"],
    type: json["type"],
    theorySubjectId: json["theory_subject_id"],
  );

  Map<String, dynamic> toJson() => {
    "subject_group_subjects_id": subjectGroupSubjectsId,
    "subject_id": subjectId,
    "name": name,
    "type": type,
    "theory_subject_id": theorySubjectId,
  };
}