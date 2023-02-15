// To parse this JSON data, do
//
//     final classSectionModel = classSectionModelFromJson(jsonString);

import 'dart:convert';

ClassSectionModel classSectionModelFromJson(String str) => ClassSectionModel.fromJson(json.decode(str));

String classSectionModelToJson(ClassSectionModel data) => json.encode(data.toJson());

class ClassSectionModel {
  ClassSectionModel({
    required this.status,
    required this.response,
  });

  bool status;
  List<Response> response;

  factory ClassSectionModel.fromJson(Map<String, dynamic> json) => ClassSectionModel(
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
    required this.sectionId,
    required this.sectionName,
  });

  String sectionId;
  String sectionName;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    sectionId: json["section_id"],
    sectionName: json["section_name"],
  );

  Map<String, dynamic> toJson() => {
    "section_id": sectionId,
    "section_name": sectionName,
  };
}