import 'dart:convert';


import 'package:http/http.dart' as http;
 class SchoolIdController {
  List SchoolIdControllerList = [];

 static Future<List<SchoolIdController>?> postData() async {
    print("fdddddddddddddddddddd44444444444444555555555555555555444");
    //    var headers = {
    //   'Content-Type': 'text/plain',
    //   'Cookie': 'ci_session=72ad09608320993a07938376d6296f08fb88ea49'
    // };
    var request = http.Request('POST', Uri.parse(
        'https://e-gyan.co.in/api/teacherwebservices/getclasssection'));
    request.body = '''{\n"company_key":"Od9EFRCPo8ach2Hk"\n}''';
    // request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // final _model = await response.stream.bytesToString();
      // print(_model);

      // final decodedMap = json.decode(_model);
      // List<SchoolIdController>.add(decodedMap);
      List<SchoolIdController> _model = json.decode(await response.stream.bytesToString());
      return _model;


      // List <model_all> myList = jsonDecode( await response.stream.bytesToString());

      print("fdddddddddddddddddddd44444444444444555555555555555555444");
      // print(myList);


    }
    else {
      print(response.reasonPhrase);
    }
    print("fdddddddddddddddddddddddddddddddddddddddddddd444444444");

    return null;
  }
}
