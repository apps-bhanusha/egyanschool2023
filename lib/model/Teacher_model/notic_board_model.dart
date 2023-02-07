// To parse this JSON data, do
//
//     final noticBoardModel = noticBoardModelFromJson(jsonString);

import 'dart:convert';

NoticBoardModel noticBoardModelFromJson(String str) => NoticBoardModel.fromJson(json.decode(str));

String noticBoardModelToJson(NoticBoardModel data) => json.encode(data.toJson());

class NoticBoardModel {
  NoticBoardModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  List<Response> response;

  factory NoticBoardModel.fromJson(Map<String, dynamic> json) => NoticBoardModel(
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
    required this.publishDate,
    required this.message,
  });

  String id;
  String title;
  DateTime publishDate;
  String message;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    title: json["title"],
    publishDate: DateTime.parse(json["publish_date"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "publish_date": "${publishDate.year.toString().padLeft(4, '0')}-${publishDate.month.toString().padLeft(2, '0')}-${publishDate.day.toString().padLeft(2, '0')}",
    "message": message,
  };
}
