// To parse this JSON data, do
//
//     final monthlyPresentSummary = monthlyPresentSummaryFromJson(jsonString);

import 'dart:convert';

MonthlyPresentSummary monthlyPresentSummaryFromJson(String str) => MonthlyPresentSummary.fromJson(json.decode(str));

String monthlyPresentSummaryToJson(MonthlyPresentSummary data) => json.encode(data.toJson());

class MonthlyPresentSummary {
  MonthlyPresentSummary({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  List<Response> response;

  factory MonthlyPresentSummary.fromJson(Map<String, dynamic> json) => MonthlyPresentSummary(
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
