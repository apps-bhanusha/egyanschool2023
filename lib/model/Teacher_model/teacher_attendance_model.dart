// To parse this JSON data, do
//
//     final teacherAttendanceModel = teacherAttendanceModelFromJson(jsonString);

import 'dart:convert';

TeacherAttendanceModel teacherAttendanceModelFromJson(String str) => TeacherAttendanceModel.fromJson(json.decode(str));

String teacherAttendanceModelToJson(TeacherAttendanceModel data) => json.encode(data.toJson());

class TeacherAttendanceModel {
  TeacherAttendanceModel({
    required this.status,
    required this.response,
  });

  bool status;
  List<Response> response;

  factory TeacherAttendanceModel.fromJson(Map<String, dynamic> json) => TeacherAttendanceModel(
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
    required this.date,
    required this.staffAttendanceTypeId,
    required this.type,
    required this.shortType,
  });

  DateTime date;
  String staffAttendanceTypeId;
  Type type;
  ShortType shortType;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    date: DateTime.parse(json["date"]),
    staffAttendanceTypeId: json["staff_attendance_type_id"],
    type: typeValues.map[json["type"]]!,
    shortType: shortTypeValues.map[json["short_type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "staff_attendance_type_id": staffAttendanceTypeId,
    "type": typeValues.reverse[type],
    "short_type": shortTypeValues.reverse[shortType],
  };
}

enum ShortType { P, L, F }

final shortTypeValues = EnumValues({
  "F": ShortType.F,
  "L": ShortType.L,
  "P": ShortType.P
});

enum Type { PRESENT, LATE, HALF_DAY }

final typeValues = EnumValues({
  "Half Day": Type.HALF_DAY,
  "Late": Type.LATE,
  "Present": Type.PRESENT
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
