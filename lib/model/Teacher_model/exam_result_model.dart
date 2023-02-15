// To parse this JSON data, do
//
//     final examResultModel = examResultModelFromJson(jsonString);

import 'dart:convert';

ExamResultModel examResultModelFromJson(String str) => ExamResultModel.fromJson(json.decode(str));

String examResultModelToJson(ExamResultModel data) => json.encode(data.toJson());

class ExamResultModel {
  ExamResultModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  Response response;

  factory ExamResultModel.fromJson(Map<String, dynamic> json) => ExamResultModel(
    status: json["status"],
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": response.toJson(),
  };
}

class Response {
  Response({
    required this.examResult,
  });

  List<ExamResult> examResult;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    examResult: List<ExamResult>.from(json["examResult"].map((x) => ExamResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "examResult": List<dynamic>.from(examResult.map((x) => x.toJson())),
  };
}

class ExamResult {
  ExamResult({
    required this.examGroupId,
    required this.examGroup,
    required this.exam,
    required this.subjectId,
    required this.subjectName,
    required this.dateFrom,
    required this.timeFrom,
    required this.duration,
    required this.roomNo,
    required this.maxMarks,
    required this.minMarks,
    required this.getMarks,
    required this.note,
    required this.attendence,
    required this.studentSessionId,
    required this.result,
  });

  String examGroupId;
  String examGroup;
  String exam;
  String subjectId;
  String subjectName;
  DateTime dateFrom;
  String timeFrom;
  String duration;
  String roomNo;
  String maxMarks;
  String minMarks;
  String getMarks;
  String note;
  String attendence;
  String studentSessionId;
  String result;

  factory ExamResult.fromJson(Map<String, dynamic> json) => ExamResult(
    examGroupId: json["exam_group_id"],
    examGroup: json["exam_group"],
    exam: json["exam"],
    subjectId: json["subject_id"],
    subjectName: json["subject_name"],
    dateFrom: DateTime.parse(json["date_from"]),
    timeFrom: json["time_from"],
    duration: json["duration"],
    roomNo: json["room_no"],
    maxMarks: json["max_marks"],
    minMarks: json["min_marks"],
    getMarks: json["get_marks"],
    note: json["note"],
    attendence: json["attendence"],
    studentSessionId: json["student_session_id"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "exam_group_id": examGroupId,
    "exam_group": examGroup,
    "exam": exam,
    "subject_id": subjectId,
    "subject_name": subjectName,
    "date_from": "${dateFrom.year.toString().padLeft(4, '0')}-${dateFrom.month.toString().padLeft(2, '0')}-${dateFrom.day.toString().padLeft(2, '0')}",
    "time_from": timeFrom,
    "duration": duration,
    "room_no": roomNo,
    "max_marks": maxMarks,
    "min_marks": minMarks,
    "get_marks": getMarks,
    "note": note,
    "attendence": attendence,
    "student_session_id": studentSessionId,
    "result": result,
  };
}
