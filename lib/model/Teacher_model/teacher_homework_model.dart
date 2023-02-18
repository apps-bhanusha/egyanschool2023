// To parse this JSON data, do
//
//     final teacherHomeWorkModel = teacherHomeWorkModelFromJson(jsonString);

import 'dart:convert';

TeacherHomeWorkModel teacherHomeWorkModelFromJson(String str) => TeacherHomeWorkModel.fromJson(json.decode(str));

String teacherHomeWorkModelToJson(TeacherHomeWorkModel data) => json.encode(data.toJson());

class TeacherHomeWorkModel {
  TeacherHomeWorkModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  List<Response> response;

  factory TeacherHomeWorkModel.fromJson(Map<String, dynamic> json) => TeacherHomeWorkModel(
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
    required this.responseClass,
    required this.sectionId,
    required this.section,
    required this.homeworkDate,
    required this.submitDate,
    required this.subjectGroupSubjectId,
    required this.subjectId,
    required this.subjectName,
    required this.description,
    required this.document,
  });

  String id;
  String classId;
  String responseClass;
  String sectionId;
  String section;
  DateTime homeworkDate;
  DateTime submitDate;
  String subjectGroupSubjectId;
  String subjectId;
  String subjectName;
  String description;
  String document;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    classId: json["class_id"],
    responseClass: json["class"]??"",
    sectionId: json["section_id"],
    section: json["section"]??"",
    homeworkDate: DateTime.parse(json["homework_date"]),
    submitDate: DateTime.parse(json["submit_date"]),
    subjectGroupSubjectId: json["subject_group_subject_id"],
    subjectId: json["subject_id"],
    subjectName: json["subject_name"]??"",
    description: json["description"],
    document: json["document"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "class_id": classId,
    "class": classValues.reverse[responseClass],
    "section_id": sectionId,
    "section": sectionValues.reverse[section],
    "homework_date": "${homeworkDate.year.toString().padLeft(4, '0')}-${homeworkDate.month.toString().padLeft(2, '0')}-${homeworkDate.day.toString().padLeft(2, '0')}",
    "submit_date": "${submitDate.year.toString().padLeft(4, '0')}-${submitDate.month.toString().padLeft(2, '0')}-${submitDate.day.toString().padLeft(2, '0')}",
    "subject_group_subject_id": subjectGroupSubjectId,
    "subject_id": subjectId,
    "subject_name": subjectNameValues.reverse[subjectName],
    "description": description,
    "document": document,
  };
}

enum Class { THE_1_ST }

final classValues = EnumValues({
  "1st": Class.THE_1_ST
});

enum Section { A }

final sectionValues = EnumValues({
  "A": Section.A
});

enum SubjectName { HINDI, ENGLISH }

final subjectNameValues = EnumValues({
  "ENGLISH": SubjectName.ENGLISH,
  "HINDI": SubjectName.HINDI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}


//////////////////////

// // To parse this JSON data, do
// //
// //     final teacherHomeWorkModel = teacherHomeWorkModelFromJson(jsonString);
//
// import 'dart:convert';
//
// TeacherHomeWorkModel teacherHomeWorkModelFromJson(String str) => TeacherHomeWorkModel.fromJson(json.decode(str));
//
// String teacherHomeWorkModelToJson(TeacherHomeWorkModel data) => json.encode(data.toJson());
//
// class TeacherHomeWorkModel {
//   TeacherHomeWorkModel({
//     required this.status,
//     required this.message,
//     required this.response,
//   });
//
//   bool status;
//   String message;
//   List<Response> response;
//
//   factory TeacherHomeWorkModel.fromJson(Map<String, dynamic> json) => TeacherHomeWorkModel(
//     status: json["status"],
//     message: json["message"],
//     response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "response": List<dynamic>.from(response.map((x) => x.toJson())),
//   };
// }
//
// class Response {
//   Response({
//     required this.id,
//     required this.classId,
//     required this.sectionId,
//     required this.homeworkDate,
//     required this.submitDate,
//     required this.subjectGroupSubjectId,
//     required this.subjectId,
//     required this.subjectName,
//     required this.description,
//     required this.document,
//   });
//
//   String id;
//   String classId;
//   String sectionId;
//   DateTime homeworkDate;
//   DateTime submitDate;
//   String subjectGroupSubjectId;
//   String subjectId;
//   String subjectName;
//   String description;
//   String document;
//
//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//     id: json["id"],
//     classId: json["class_id"],
//     sectionId: json["section_id"],
//     homeworkDate: DateTime.parse(json["homework_date"]),
//     submitDate: DateTime.parse(json["submit_date"]),
//     subjectGroupSubjectId: json["subject_group_subject_id"],
//     subjectId: json["subject_id"],
//     subjectName: json["subject_name"]??"",
//     description: json["description"],
//     document: json["document"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "class_id": classId,
//     "section_id": sectionId,
//     "homework_date": "${homeworkDate.year.toString().padLeft(4, '0')}-${homeworkDate.month.toString().padLeft(2, '0')}-${homeworkDate.day.toString().padLeft(2, '0')}",
//     "submit_date": "${submitDate.year.toString().padLeft(4, '0')}-${submitDate.month.toString().padLeft(2, '0')}-${submitDate.day.toString().padLeft(2, '0')}",
//     "subject_group_subject_id": subjectGroupSubjectId,
//     "subject_id": subjectId,
//     "subject_name": subjectNameValues.reverse[subjectName],
//     "description": description,
//     "document": document,
//   };
// }
//
// enum SubjectName { ENGLISH, HINDI }
//
// final subjectNameValues = EnumValues({
//   "ENGLISH": SubjectName.ENGLISH,
//   "HINDI": SubjectName.HINDI
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
