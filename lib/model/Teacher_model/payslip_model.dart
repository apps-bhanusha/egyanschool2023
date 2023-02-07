// To parse this JSON data, do
//
//     final paySlipModel = paySlipModelFromJson(jsonString);

import 'dart:convert';

PaySlipModel paySlipModelFromJson(String str) => PaySlipModel.fromJson(json.decode(str));

String paySlipModelToJson(PaySlipModel data) => json.encode(data.toJson());

class PaySlipModel {
  PaySlipModel({
    required this.status,
    required this.response,
  });

  bool status;
  List<Response> response;

  factory PaySlipModel.fromJson(Map<String, dynamic> json) => PaySlipModel(
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
    required this.staffId,
    required this.basic,
    required this.totalAllowance,
    required this.totalDeduction,
    required this.leaveDeduction,
    required this.tax,
    required this.netSalary,
    required this.status,
    required this.month,
    required this.year,
    required this.paymentMode,
    required this.paymentDate,
    required this.remark,
  });

  String id;
  String staffId;
  String basic;
  String totalAllowance;
  String totalDeduction;
  String leaveDeduction;
  String tax;
  String netSalary;
  String status;
  String month;
  String year;
  String paymentMode;
  DateTime paymentDate;
  String remark;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    staffId: json["staff_id"],
    basic: json["basic"],
    totalAllowance: json["total_allowance"],
    totalDeduction: json["total_deduction"],
    leaveDeduction: json["leave_deduction"],
    tax: json["tax"],
    netSalary: json["net_salary"],
    status: json["status"],
    month: json["month"],
    year: json["year"],
    paymentMode: json["payment_mode"],
    paymentDate: DateTime.parse(json["payment_date"]),
    remark: json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "staff_id": staffId,
    "basic": basic,
    "total_allowance": totalAllowance,
    "total_deduction": totalDeduction,
    "leave_deduction": leaveDeduction,
    "tax": tax,
    "net_salary": netSalary,
    "status": status,
    "month": month,
    "year": year,
    "payment_mode": paymentMode,
    "payment_date": "${paymentDate.year.toString().padLeft(4, '0')}-${paymentDate.month.toString().padLeft(2, '0')}-${paymentDate.day.toString().padLeft(2, '0')}",
    "remark": remark,
  };
}
