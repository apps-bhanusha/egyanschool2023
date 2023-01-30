// To parse this JSON data, do
//
//     final studentLoginModel = studentLoginModelFromJson(jsonString);

import 'dart:convert';

StudentLoginModel studentLoginModelFromJson(String str) => StudentLoginModel.fromJson(json.decode(str));

String studentLoginModelToJson(StudentLoginModel data) => json.encode(data.toJson());

class StudentLoginModel {
  StudentLoginModel({
    required this.status,
    required this.message,
    required this.response,
    required this.parentInfo,
  });

  bool status;
  String message;
  List<Response> response;
  Map<String, String?> parentInfo;

  factory StudentLoginModel.fromJson(Map<String, dynamic> json) => StudentLoginModel(
    status: json["status"],
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    parentInfo: Map.from(json["parent_info"]).map((k, v) => MapEntry<String, String?>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "parent_info": Map.from(parentInfo).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Response {
  Response({
    required this.studentId,
    required this.studentSessionId,
    required this.parentId,
    required this.name,
    required this.gender,
    required this.responseClass,
    required this.section,
    required this.dob,
    required this.fathername,
    required this.mothername,
    required this.profileimage,
    required this.teachername,
    required this.fee,
    required this.attandance,
  });

  String studentId;
  String studentSessionId;
  String parentId;
  String name;
  String gender;
  String responseClass;
  String section;
  DateTime dob;
  String fathername;
  String mothername;
  String profileimage;
  String teachername;
  Fee fee;
  Attandance attandance;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    studentId: json["student_id"],
    studentSessionId: json["student_session_id"],
    parentId: json["parent_id"],
    name: json["name"],
    gender: json["gender"],
    responseClass: json["class"],
    section: json["section"],
    dob: DateTime.parse(json["DOB"]),
    fathername: json["fathername"],
    mothername: json["mothername"],
    profileimage: json["profileimage"]??"",
    teachername: json["teachername"],
    fee: Fee.fromJson(json["fee"]),
    attandance: Attandance.fromJson(json["attandance"]),
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "student_session_id": studentSessionId,
    "parent_id": parentId,
    "name": name,
    "gender": gender,
    "class": responseClass,
    "section": section,
    "DOB": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "fathername": fathername,
    "mothername": mothername,
    "profileimage": profileimage,
    "teachername": teachername,
    "fee": fee.toJson(),
    "attandance": attandance.toJson(),
  };
}

class Attandance {
  Attandance({
    required this.studentSessionId,
    required this.present,
    required this.lateWithExcuse,
    required this.late,
    required this.absent,
    required this.holiday,
    required this.halfDay,
  });

  String studentSessionId;
  String present;
  String lateWithExcuse;
  String late;
  String absent;
  String holiday;
  String halfDay;

  factory Attandance.fromJson(Map<String, dynamic> json) => Attandance(
    studentSessionId: json["student_session_id"],
    present: json["present"],
    lateWithExcuse: json["late_with_excuse"],
    late: json["late"],
    absent: json["absent"],
    holiday: json["holiday"],
    halfDay: json["half_day"],
  );

  Map<String, dynamic> toJson() => {
    "student_session_id": studentSessionId,
    "present": present,
    "late_with_excuse": lateWithExcuse,
    "late": late,
    "absent": absent,
    "holiday": holiday,
    "half_day": halfDay,
  };
}

class Fee {
  Fee({
    required this.totalAmount,
    required this.totalDiscountAmount,
    required this.totalDepositeAmount,
    required this.totalFineAmount,
    required this.totalBalanceAmount,
  });

  int totalAmount;
  int totalDiscountAmount;
  int totalDepositeAmount;
  int totalFineAmount;
  int totalBalanceAmount;

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
    totalAmount: json["total_amount"],
    totalDiscountAmount: json["total_discount_amount"],
    totalDepositeAmount: json["total_deposite_amount"],
    totalFineAmount: json["total_fine_amount"],
    totalBalanceAmount: json["total_balance_amount"],
  );

  Map<String, dynamic> toJson() => {
    "total_amount": totalAmount,
    "total_discount_amount": totalDiscountAmount,
    "total_deposite_amount": totalDepositeAmount,
    "total_fine_amount": totalFineAmount,
    "total_balance_amount": totalBalanceAmount,
  };
}
