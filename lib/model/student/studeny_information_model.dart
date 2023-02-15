// To parse this JSON data, do
//
//     final studentInformationListModal = studentInformationListModalFromJson(jsonString);

import 'dart:convert';

StudentInformationListModal studentInformationListModalFromJson(String str) => StudentInformationListModal.fromJson(json.decode(str));

String studentInformationListModalToJson(StudentInformationListModal data) => json.encode(data.toJson());

class StudentInformationListModal {
    StudentInformationListModal({
        required this.status,
        required this.response,
    });

    bool status;
    List<Response> response;

    factory StudentInformationListModal.fromJson(Map<String, dynamic> json) => StudentInformationListModal(
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
        required this.admissionNo,
        required this.studentSessionId,
        required this.studentId,
        required this.studentName,
        required this.fatherName,
        required this.studentClass,
        required this.studentSection,
    });

    String? admissionNo;
    String? studentSessionId;
    String? studentId;
    String? studentName;
    String? fatherName;
    String? studentClass;
    String? studentSection;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        admissionNo: json["admission_no"],
        studentSessionId: json["student_session_id"],
        studentId: json["student_id"],
        studentName: json["student_name"]??json["firstname"],
        fatherName: json["father_name"],
        studentClass: json["class"],
        studentSection: json["section"],
    );

    Map<String, dynamic> toJson() => {
        "admission_no": admissionNo,
        "student_session_id": studentSessionId,
        "student_id": studentId,
        "student_name": studentName,
        "father_name": fatherName,
        "father_name": studentClass,
        "father_name": studentSection,
    };
}
