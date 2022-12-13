import 'dart:convert';


import 'package:http/http.dart' as http;
 class SchoolIdController {
  List <String>SchoolIdControllerList = [];
 // void alldta(){
 //   SchoolIdControllerList.add("5");
 //
 // }

  Future<void> postData() async {
    print("fdddddddddddddddddddd44444444444444555555555555555555444");
    //    var headers = {
    //   'Content-Type': 'text/plain',
    //   'Cookie': 'ci_session=72ad09608320993a07938376d6296f08fb88ea49'
    // };
    var request = http.Request('POST', Uri.parse('https://e-gyan.co.in/api/parentwebservices/getProjectKey'));
    request.body = '''{\n    "school_id":"5"\n}''';
    // request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String _model=await response.stream.bytesToString();
     print( _model);
     print("777777777777777777777777777");
      SchoolIdControllerList.add(_model);
      // print(await response.stream.bytesToString());

    }
    else {
      print(response.reasonPhrase);
    }

  }}
