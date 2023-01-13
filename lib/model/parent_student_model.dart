// To parse this JSON data, do
//
//     final parentStudentListModel = parentStudentListModelFromJson(jsonString);

import 'dart:convert';

ParentStudentListModel? parentStudentListModelFromJson(String str) => ParentStudentListModel.fromJson(json.decode(str));

String parentStudentListModelToJson(ParentStudentListModel? data) => json.encode(data!.toJson());

class ParentStudentListModel {
    ParentStudentListModel({
        this.status,
        this.message,
        this.response,
        this.parentInfo,
    });

    bool? status;
    String? message;
    List<Response?>? response;
    Map<String, String?>? parentInfo;

    factory ParentStudentListModel.fromJson(Map<String, dynamic> json) => ParentStudentListModel(
        status: json["status"],
        message: json["message"],
        response: json["response"] == null ? [] : List<Response?>.from(json["response"]!.map((x) => Response.fromJson(x))),
        parentInfo: Map.from(json["parent_info"]!).map((k, v) => MapEntry<String, String?>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x!.toJson())),
        "parent_info": Map.from(parentInfo!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Response {
    Response({
        this.studentId,
        this.studentSessionId,
        this.parentId,
        this.name,
        this.gender,
        this.responseClass,
        this.section,
        this.dob,
        this.fathername,
        this.mothername,
        this.profileimage,
        this.teachername,
        this.fee,
        this.attandance,
    });

    String? studentId;
    String? studentSessionId;
    String? parentId;
    String? name;
    String? gender;
    String? responseClass;
    String? section;
    DateTime? dob;
    String? fathername;
    String? mothername;
    String? profileimage;
    String? teachername;
    Fee? fee;
    Attandance? attandance;

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
        profileimage: json["profileimage"],
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
        "DOB": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "fathername": fathername,
        "mothername": mothername,
        "profileimage": profileimage,
        "teachername": teachername,
        "fee": fee!.toJson(),
        "attandance": attandance!.toJson(),
    };
}

class Attandance {
    Attandance({
        this.studentSessionId,
        this.present,
        this.lateWithExcuse,
        this.late,
        this.absent,
        this.holiday,
        this.halfDay,
    });

    String? studentSessionId;
    String? present;
    String? lateWithExcuse;
    String? late;
    String? absent;
    String? holiday;
    String? halfDay;

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
        this.totalAmount,
        this.totalDiscountAmount,
        this.totalDepositeAmount,
        this.totalFineAmount,
        this.totalBalanceAmount,
    });

    int? totalAmount;
    int? totalDiscountAmount;
    int? totalDepositeAmount;
    int? totalFineAmount;
    int? totalBalanceAmount;

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
