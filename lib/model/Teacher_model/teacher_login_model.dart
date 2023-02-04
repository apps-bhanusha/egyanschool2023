// To parse this JSON data, do
//
//     final teacherLoginModel = teacherLoginModelFromJson(jsonString);

import 'dart:convert';

TeacherLoginModel teacherLoginModelFromJson(String str) => TeacherLoginModel.fromJson(json.decode(str));

String teacherLoginModelToJson(TeacherLoginModel data) => json.encode(data.toJson());

class TeacherLoginModel {
  TeacherLoginModel({
    required this.status,
    required this.message,
    required this.response,
    required this.company,
    required this.totalAbsent,
    required this.totalStudent,
    required this.totalComplaint,
    required this.flag,
  });

  bool status;
  String message;
  Map<String, String?> response;
  Company company;
  int totalAbsent;
  int totalStudent;
  int totalComplaint;
  int flag;

  factory TeacherLoginModel.fromJson(Map<String, dynamic> json) => TeacherLoginModel(
    status: json["status"],
    message: json["message"],
    response: Map.from(json["response"]).map((k, v) => MapEntry<String, String?>(k, v)),
    company: Company.fromJson(json["company"]),
    totalAbsent: json["total_absent"],
    totalStudent: json["total_student"],
    totalComplaint: json["total_complaint"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": Map.from(response).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "company": company.toJson(),
    "total_absent": totalAbsent,
    "total_student": totalStudent,
    "total_complaint": totalComplaint,
    "flag": flag,
  };
}

class Company {
  Company({
    required this.comapnyLat,
    required this.companyLang,
  });

  String comapnyLat;
  String companyLang;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    comapnyLat: json["comapny_lat"],
    companyLang: json["company_lang"],
  );

  Map<String, dynamic> toJson() => {
    "comapny_lat": comapnyLat,
    "company_lang": companyLang,
  };
}
