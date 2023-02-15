// To parse this JSON data, do
//
//     final classListModel = classListModelFromJson(jsonString);

import 'dart:convert';

ClassListModel classListModelFromJson(String str) => ClassListModel.fromJson(json.decode(str));

String classListModelToJson(ClassListModel data) => json.encode(data.toJson());

class ClassListModel {
  ClassListModel({
    required this.status,
    required this.response,
  });

  bool status;
  List<Response> response;

  factory ClassListModel.fromJson(Map<String, dynamic> json) => ClassListModel(
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
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}