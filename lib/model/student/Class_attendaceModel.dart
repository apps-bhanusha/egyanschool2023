// To parse this JSON data, do
//
//     final classAttendenceListModal = classAttendenceListModalFromJson(jsonString);

import 'dart:convert';

ClassAttendenceListModal classAttendenceListModalFromJson(String str) => ClassAttendenceListModal.fromJson(json.decode(str));

String classAttendenceListModalToJson(ClassAttendenceListModal data) => json.encode(data.toJson());

class ClassAttendenceListModal {
    ClassAttendenceListModal({
        required this.status,
        required this.flag,
        required this.response,
    });

    bool status;
    dynamic flag;
    List<Response> response;

    factory ClassAttendenceListModal.fromJson(Map<String, dynamic> json) => ClassAttendenceListModal(
        status: json["status"],
        flag: json["flag"],
        response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "flag": flag,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Response {
    Response({
        required this.attendenceId,
        required this.firstname,
        required this.date,
        this.remark,
        required this.rollNo,
        required this.admissionNo,
        required this.lastname,
        this.attendenceTypeId,
        required this.studentSessionId,
        this.attType,
        this.key,
    });

    String attendenceId;
    String firstname;
    String date;
    dynamic remark;
    String rollNo;
    String admissionNo;
    String lastname;
    dynamic attendenceTypeId;
    String studentSessionId;
    dynamic attType;
    dynamic key;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        attendenceId: json["attendence_id"],
        firstname: json["firstname"],
        date: json["date"],
        remark: json["remark"],
        rollNo: json["roll_no"],
        admissionNo: json["admission_no"],
        lastname: json["lastname"],
        attendenceTypeId: json["attendence_type_id"],
        studentSessionId: json["student_session_id"],
        attType: json["att_type"],
        key: json["key"],
    );

    Map<String, dynamic> toJson() => {
        "attendence_id": attendenceId,
        "firstname": firstname,
        "date": date,
        "remark": remark,
        "roll_no": rollNo,
        "admission_no": admissionNo,
        "lastname": lastname,
        "attendence_type_id": attendenceTypeId,
        "student_session_id": studentSessionId,
        "att_type": attType,
        "key": key,
    };
}
