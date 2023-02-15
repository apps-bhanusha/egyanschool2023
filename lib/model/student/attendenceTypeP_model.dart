// To parse this JSON data, do
//
//     final attendenceTypeModal = attendenceTypeModalFromJson(jsonString);

import 'dart:convert';

AttendenceTypeModal attendenceTypeModalFromJson(String str) => AttendenceTypeModal.fromJson(json.decode(str));

String attendenceTypeModalToJson(AttendenceTypeModal data) => json.encode(data.toJson());

class AttendenceTypeModal {
    AttendenceTypeModal({
        required this.status,
        required this.response,
    });

    bool status;
    List<Response> response;

    factory AttendenceTypeModal.fromJson(Map<String, dynamic> json) => AttendenceTypeModal(
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
        required this.id,
        required this.type,
        required this.keyValue,
    });

    String id;
    String type;
    String keyValue;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        type: json["type"],
        keyValue: json["key_value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "key_value": keyValue,
    };
}
