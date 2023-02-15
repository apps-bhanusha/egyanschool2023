// To parse this JSON data, do
//
//     final staffLeaveRecordModel = staffLeaveRecordModelFromJson(jsonString);

import 'dart:convert';

StaffLeaveRecordModel staffLeaveRecordModelFromJson(String str) => StaffLeaveRecordModel.fromJson(json.decode(str));

String staffLeaveRecordModelToJson(StaffLeaveRecordModel data) => json.encode(data.toJson());

class StaffLeaveRecordModel {
  StaffLeaveRecordModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  List<Map<String, String?>> response;

  factory StaffLeaveRecordModel.fromJson(Map<String, dynamic> json) => StaffLeaveRecordModel(
    status: json["status"],
    message: json["message"],
    response: List<Map<String, String?>>.from(json["response"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": List<dynamic>.from(response.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
  };
}
