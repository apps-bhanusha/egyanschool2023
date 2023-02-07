// To parse this JSON data, do
//
//     final staffMonthlyPresentSummaryModel = staffMonthlyPresentSummaryModelFromJson(jsonString);

import 'dart:convert';

StaffMonthlyPresentSummaryModel staffMonthlyPresentSummaryModelFromJson(String str) => StaffMonthlyPresentSummaryModel.fromJson(json.decode(str));

String staffMonthlyPresentSummaryModelToJson(StaffMonthlyPresentSummaryModel data) => json.encode(data.toJson());

class StaffMonthlyPresentSummaryModel {
  StaffMonthlyPresentSummaryModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  List<Response> response;

  factory StaffMonthlyPresentSummaryModel.fromJson(Map<String, dynamic> json) => StaffMonthlyPresentSummaryModel(
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
    required this.month,
    this.present,
  });

  String month;
  String? present;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    month: json["month"],
    present: json["present"],
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "present": present,
  };
}
