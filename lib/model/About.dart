// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromJson(jsonString);

import 'dart:convert';

AboutModel aboutModelFromJson(String str) => AboutModel.fromJson(json.decode(str));

String aboutModelToJson(AboutModel data) => json.encode(data.toJson());

class AboutModel {
    AboutModel({
        required this.status,
        required this.message,
        required this.response,
    });

    bool status;
    String message;
    Response response;

    factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
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
        required this.description,
    });

    String title;
    String description;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}
