// To parse this JSON data, do
//
//     final staffLeaveTypeModel = staffLeaveTypeModelFromJson(jsonString);

import 'dart:convert';

StaffLeaveTypeModel staffLeaveTypeModelFromJson(String str) => StaffLeaveTypeModel.fromJson(json.decode(str));

String staffLeaveTypeModelToJson(StaffLeaveTypeModel data) => json.encode(data.toJson());

class StaffLeaveTypeModel {
  StaffLeaveTypeModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  List<Response> response;

  factory StaffLeaveTypeModel.fromJson(Map<String, dynamic> json) => StaffLeaveTypeModel(
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
    required this.type,
  });

  String id;
  String type;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}
