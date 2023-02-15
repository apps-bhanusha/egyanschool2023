// To parse this JSON data, do
//
//     final classTimeTableModel = classTimeTableModelFromJson(jsonString);

import 'dart:convert';

ClassTimeTableModel classTimeTableModelFromJson(String str) => ClassTimeTableModel.fromJson(json.decode(str));

String classTimeTableModelToJson(ClassTimeTableModel data) => json.encode(data.toJson());

class ClassTimeTableModel {
  ClassTimeTableModel({
    required this.status,
    required this.message,
    required this.response,
  });

  bool status;
  String message;
  Response response;

  factory ClassTimeTableModel.fromJson(Map<String, dynamic> json) => ClassTimeTableModel(
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
    required this.title,
    required this.result,
  });

  String title;
  List<Result> result;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    title: json["title"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.day,
    required this.timetable,
  });

  String day;
  List<Timetable> timetable;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    day: json["day"],
    timetable: List<Timetable>.from(json["timetable"].map((x) => Timetable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "timetable": List<dynamic>.from(timetable.map((x) => x.toJson())),
  };
}

class Timetable {
  Timetable({
    required this.subjectId,
    required this.subjectName,
    required this.staffId,
    required this.teacherName,
    required this.timeFrom,
    required this.timeTo,
    required this.roomNo,
  });

  String subjectId;
  SubjectName subjectName;
  String staffId;
  TeacherName teacherName;
  String timeFrom;
  String timeTo;
  String roomNo;

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
    subjectId: json["subject_id"],
    subjectName: subjectNameValues.map[json["subject_name"]]!,
    staffId: json["staff_id"],
    teacherName: teacherNameValues.map[json["teacher_name"]]!,
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
    roomNo: json["room_no"],
  );

  Map<String, dynamic> toJson() => {
    "subject_id": subjectId,
    "subject_name": subjectNameValues.reverse[subjectName],
    "staff_id": staffId,
    "teacher_name": teacherNameValues.reverse[teacherName],
    "time_from": timeFrom,
    "time_to": timeTo,
    "room_no": roomNo,
  };
}

enum SubjectName { HINDI, ENGLISH, MATHS, EVS, GK }

final subjectNameValues = EnumValues({
  "ENGLISH": SubjectName.ENGLISH,
  "EVS": SubjectName.EVS,
  "GK": SubjectName.GK,
  "HINDI": SubjectName.HINDI,
  "Maths": SubjectName.MATHS
});

enum TeacherName { RAM_PAL_SINGH, VIVEK_GUPTA, SHARAD_SHRIVASTAVA, ARTI_PATHAK }

final teacherNameValues = EnumValues({
  "Arti Pathak": TeacherName.ARTI_PATHAK,
  "RamPal Singh": TeacherName.RAM_PAL_SINGH,
  "Sharad Shrivastava": TeacherName.SHARAD_SHRIVASTAVA,
  "Vivek gupta": TeacherName.VIVEK_GUPTA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
