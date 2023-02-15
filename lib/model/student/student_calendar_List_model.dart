// To parse this JSON data, do
//
//     final studentcalenderlistModal = studentcalenderlistModalFromJson(jsonString);

import 'dart:convert';

StudentcalenderlistModal studentcalenderlistModalFromJson(String str) => StudentcalenderlistModal.fromJson(json.decode(str));

String studentcalenderlistModalToJson(StudentcalenderlistModal data) => json.encode(data.toJson());

class StudentcalenderlistModal {
    StudentcalenderlistModal({
        required this.status,
        required this.message,
        required this.response,
        required this.yearDate,
    });

    bool status;
    String message;
    List<Response> response;
    YearDate yearDate;

    factory StudentcalenderlistModal.fromJson(Map<String, dynamic> json) => StudentcalenderlistModal(
        status: json["status"],
        message: json["message"],
        response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
        yearDate: YearDate.fromJson(json["year_date"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "year_date": yearDate.toJson(),
    };
}

class Response {
    Response({
        required this.date,
        required this.title,
        required this.shortTitile,
    });

    DateTime date;
    String? title;
    String? shortTitile;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        date: DateTime.parse(json["date"]),
        title: json["title"],
        shortTitile: json["short_titile"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "title": title,
        "short_titile": shortTitile,
    };
}

class YearDate {
    YearDate({
        required this.startDate,
        required this.endDate,
    });

    DateTime startDate;
    DateTime endDate;

    factory YearDate.fromJson(Map<String, dynamic> json) => YearDate(
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    };
}
