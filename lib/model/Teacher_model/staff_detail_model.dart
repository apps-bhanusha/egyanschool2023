// To parse this JSON data, do
//
//     final staffDetailModel = staffDetailModelFromJson(jsonString);

import 'dart:convert';

StaffDetailModel staffDetailModelFromJson(String str) => StaffDetailModel.fromJson(json.decode(str));

String staffDetailModelToJson(StaffDetailModel data) => json.encode(data.toJson());

class StaffDetailModel {
    StaffDetailModel({
        required this.status,
        required this.message,
        required this.response,
        required this.inoutTime,
        required this.monthAttendance,
    });

    bool status;
    String message;
    Response response;
    InoutTime inoutTime;
    MonthAttendance monthAttendance;

    factory StaffDetailModel.fromJson(Map<String, dynamic> json) => StaffDetailModel(
        status: json["status"],
        message: json["message"],
        response: Response.fromJson(json["response"]),
        inoutTime: InoutTime.fromJson(json["inout_time"]),
        monthAttendance: MonthAttendance.fromJson(json["month_attendance"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "response": response.toJson(),
        "inout_time": inoutTime.toJson(),
        "month_attendance": monthAttendance.toJson(),
    };
}

class InoutTime {
    InoutTime({
        this.inTime,
        this.outTime,
    });

    dynamic inTime;
    dynamic outTime;

    factory InoutTime.fromJson(Map<String, dynamic> json) => InoutTime(
        inTime: json["in_time"],
        outTime: json["out_time"],
    );

    Map<String, dynamic> toJson() => {
        "in_time": inTime,
        "out_time": outTime,
    };
}

class MonthAttendance {
    MonthAttendance({
        this.present,
        required this.daysinmonth,
    });

    dynamic present;
    String daysinmonth;

    factory MonthAttendance.fromJson(Map<String, dynamic> json) => MonthAttendance(
        present: json["present"],
        daysinmonth: json["daysinmonth"],
    );

    Map<String, dynamic> toJson() => {
        "present": present,
        "daysinmonth": daysinmonth,
    };
}

class Response {
    Response({
        required this.id,
        required this.employeeId,
        required this.department,
        required this.designation,
        required this.qualification,
        required this.name,
        required this.surname,
        required this.fatherName,
        required this.motherName,
        required this.contactNo,
        required this.emergencyContactNo,
        required this.email,
        required this.dob,
        required this.maritalStatus,
        required this.dateOfJoining,
        required this.localAddress,
        required this.permanentAddress,
        required this.image,
        required this.gender,
        required this.facebook,
        required this.twitter,
        required this.linkedin,
        required this.instagram,
        required this.userId,
        required this.isActive,
        this.deviceToken,
        required this.forceLogout,
        required this.roleId,
        required this.userType,
    });

    String id;
    String employeeId;
    String department;
    String designation;
    String qualification;
    String name;
    String surname;
    String fatherName;
    String motherName;
    String contactNo;
    String emergencyContactNo;
    String email;
    DateTime dob;
    String maritalStatus;
    DateTime dateOfJoining;
    String localAddress;
    String permanentAddress;
    String image;
    String gender;
    String facebook;
    String twitter;
    String linkedin;
    String instagram;
    String userId;
    String isActive;
    dynamic deviceToken;
    String forceLogout;
    String roleId;
    String userType;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        employeeId: json["employee_id"],
        department: json["department"],
        designation: json["designation"],
        qualification: json["qualification"],
        name: json["name"],
        surname: json["surname"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        contactNo: json["contact_no"],
        emergencyContactNo: json["emergency_contact_no"],
        email: json["email"],
        dob: DateTime.parse(json["dob"]),
        maritalStatus: json["marital_status"],
        dateOfJoining: DateTime.parse(json["date_of_joining"]),
        localAddress: json["local_address"],
        permanentAddress: json["permanent_address"],
        image: json["image"],
        gender: json["gender"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        linkedin: json["linkedin"],
        instagram: json["instagram"],
        userId: json["user_id"],
        isActive: json["is_active"],
        deviceToken: json["device_token"],
        forceLogout: json["force_logout"],
        roleId: json["role_id"],
        userType: json["user_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employee_id": employeeId,
        "department": department,
        "designation": designation,
        "qualification": qualification,
        "name": name,
        "surname": surname,
        "father_name": fatherName,
        "mother_name": motherName,
        "contact_no": contactNo,
        "emergency_contact_no": emergencyContactNo,
        "email": email,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "marital_status": maritalStatus,
        "date_of_joining": "${dateOfJoining.year.toString().padLeft(4, '0')}-${dateOfJoining.month.toString().padLeft(2, '0')}-${dateOfJoining.day.toString().padLeft(2, '0')}",
        "local_address": localAddress,
        "permanent_address": permanentAddress,
        "image": image,
        "gender": gender,
        "facebook": facebook,
        "twitter": twitter,
        "linkedin": linkedin,
        "instagram": instagram,
        "user_id": userId,
        "is_active": isActive,
        "device_token": deviceToken,
        "force_logout": forceLogout,
        "role_id": roleId,
        "user_type": userType,
    };
}