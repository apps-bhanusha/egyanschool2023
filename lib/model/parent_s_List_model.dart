// To parse this JSON data, do
//
//     final parentSListModel = parentSListModelFromJson(jsonString);

import 'dart:convert';

ParentSListModel parentSListModelFromJson(String str) => ParentSListModel.fromJson(json.decode(str));

String parentSListModelToJson(ParentSListModel data) => json.encode(data.toJson());

class ParentSListModel {
    ParentSListModel({
        required this.status,
        required this.response,
    });

    bool status;
    List<Response> response;

    factory ParentSListModel.fromJson(Map<String, dynamic> json) => ParentSListModel(
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
        this.profileimage,
        required this.admissionNo,
        required this.rollNo,
        required this.mobileno,
        required this.email,
        required this.fatherPhone,
        this.routeId,
        required this.schoolHouseId,
        required this.bloodGroup,
        required this.vehrouteId,
        required this.pickuppoint,
        required this.droppoint,
        required this.hostelRoomId,
        required this.adharNo,
        required this.samagraId,
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
    String? profileimage;
    String admissionNo;
    String rollNo;
    String mobileno;
    String email;
    String fatherPhone;
    dynamic routeId;
    String schoolHouseId;
    String bloodGroup;
    String vehrouteId;
    String pickuppoint;
    String droppoint;
    String hostelRoomId;
    String adharNo;
    String samagraId;
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
        profileimage: json["profileimage"],
        admissionNo: json["admission_no"],
        rollNo: json["roll_no"],
        mobileno: json["mobileno"],
        email: json["email"],
        fatherPhone: json["father_phone"],
        routeId: json["route_id"],
        schoolHouseId: json["school_house_id"],
        bloodGroup: json["blood_group"],
        vehrouteId: json["vehroute_id"],
        pickuppoint: json["pickuppoint"],
        droppoint: json["droppoint"],
        hostelRoomId: json["hostel_room_id"],
        adharNo: json["adhar_no"],
        samagraId: json["samagra_id"],
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
        "admission_no": admissionNo,
        "roll_no": rollNo,
        "mobileno": mobileno,
        "email": email,
        "father_phone": fatherPhone,
        "route_id": routeId,
        "school_house_id": schoolHouseId,
        "blood_group": bloodGroup,
        "vehroute_id": vehrouteId,
        "pickuppoint": pickuppoint,
        "droppoint": droppoint,
        "hostel_room_id": hostelRoomId,
        "adhar_no": adharNo,
        "samagra_id": samagraId,
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
