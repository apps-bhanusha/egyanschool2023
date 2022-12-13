// class SchoolIdController {
//   bool? status;
//   String? message;
//   Response? response;
//
//   SchoolIdController({this.status, this.message, this.response});
//
//   SchoolIdController.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     response = json['response'] != null
//         ? new Response.fromJson(json['response'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.response != null) {
//       data['response'] = this.response!.toJson();
//     }
//     return data;
//   }
// }
//
// class Response {
//   String? companyKey;
//   String? lat;
//   String? lang;
//   String? isTwoWayAuth;
//
//   Response({this.companyKey, this.lat, this.lang, this.isTwoWayAuth});
//
//   Response.fromJson(Map<String, dynamic> json) {
//     companyKey = json['company_key'];
//     lat = json['lat'];
//     lang = json['lang'];
//     isTwoWayAuth = json['is_two_way_auth'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['company_key'] = this.companyKey;
//     data['lat'] = this.lat;
//     data['lang'] = this.lang;
//     data['is_two_way_auth'] = this.isTwoWayAuth;
//     return data;
//   }}