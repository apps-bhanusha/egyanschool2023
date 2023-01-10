import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:custom_floating_action_button/custom_floating_action_button.dart';

class AddLeave extends StatefulWidget {
  const AddLeave({super.key});

  @override
  State<AddLeave> createState() => _AddLeaveState();
}

class _AddLeaveState extends State<AddLeave> with SingleTickerProviderStateMixin{
  List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);


    super.initState();
    // _loadMessages();
  }

  @override
  Widget build(BuildContext context) =>
      CustomFloatingActionButton(
        backgroundColor: Colors.transparent,
        openFloatingActionButton: const Icon(Icons.add),
        closeFloatingActionButton: const Icon(Icons.close),
        type: CustomFloatingActionButtonType.verticalUp,
        spaceFromBottom: 360,
        options:  [



          InkWell(
            onTap: () {

              Navigator.pop(context);
              _handleImageSelection();
            },
            child: CircleAvatar(
              child: Icon(Icons.add_a_photo),
            ),
          ),
          InkWell(
            onTap: () {

              Navigator.pop(context);
              _handleFileSelection();
            },
            child: CircleAvatar(
              child: Icon(Icons.file_upload),
            ),
          ),

        ],

        body: Scaffold(
          appBar: AppBar(
            title: const Text("Add Leave"),
          ),
          body:  Container(
        height: 0.35.sh,
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 10, right: 190).r,
            //   child: TextField(
            //     decoration: InputDecoration(
            //         labelText: 'Date',
            //         contentPadding: EdgeInsets.all(5),
            //         labelStyle: TextStyle(
            //           color: Colors.grey[400],
            //         )),
            //     style: GoogleFonts.dmSans(
            //       fontStyle: FontStyle.normal,
            //       fontSize: 15.sp,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            SizedBox(height: 0.010.sh),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  // optional flex property if flex is 1 because the default flex is 1
                  flex: 1,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 10).r,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'From Date',
                          contentPadding:
                          EdgeInsets.all(5).r,
                          labelStyle: TextStyle(
                              color: Colors.grey[400])),
                      style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 0.090.sw),
                Expanded(
                  // optional flex property if flex is 1 because the default flex is 1
                  flex: 1,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(right: 10).r,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'To Date',
                        contentPadding: EdgeInsets.all(5).r,
                        labelStyle: TextStyle(
                            color: Colors.grey[400]),
                      ),
                      style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              // optional flex property if flex is 1 because the default flex is 1
              flex: 1,
              child: Padding(
                padding:
                const EdgeInsets.only(left: 10,right: 10).r,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Reason',
                    contentPadding: EdgeInsets.all(5).r,
                    labelStyle: TextStyle(
                        color: Colors.grey[400]),
                  ),
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Expanded(
            flex:1,
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Attach Document",

                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],

                  ),

                ),
                SizedBox(height: 0.020.sh,),
                Container(color:Colors.black,height:0.001.sh,width: 0.96.sw,),
              ])),


            // Container(
            //   child: Text(
            //     'Attach Document',
            //
            //     style: GoogleFonts.dmSans(
            //       fontStyle: FontStyle.normal,
            //       fontSize: 15.sp,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),


        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: Container(
          color: Color.fromARGB(255, 48, 138, 190),
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo',style: TextStyle(color:Colors.white),),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File',style: TextStyle(color:Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel',style: TextStyle(color:Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,

        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'package:google_fonts/google_fonts.dart';
// class AddLeave extends StatefulWidget {
//   const AddLeave({Key? key}) : super(key: key);
//
//   @override
//   State<AddLeave> createState() => _AddLeaveState();
// }
//
// class _AddLeaveState extends State<AddLeave> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//       ),
//       body: Container(
//         height: 0.35.sh,
//         child: Column(
//           children: [
//
//             Padding(
//               padding: const EdgeInsets.only(right: 200).r,
//               child: Container(
//                 child: Text(
//                   'Add Leave',
//                   style: GoogleFonts.dmSans(
//                     fontStyle: FontStyle.normal,
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 10, right: 10),
//               child: TextField(
//                 decoration: InputDecoration(
//                     labelText: 'Date',
//                     contentPadding: EdgeInsets.all(5),
//                     labelStyle: TextStyle(
//                       color: Colors.grey[400],
//                     )),
//                 style: GoogleFonts.dmSans(
//                   fontStyle: FontStyle.normal,
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 0.010.sh),
//             Row(
//               mainAxisAlignment:
//               MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Expanded(
//                   // optional flex property if flex is 1 because the default flex is 1
//                   flex: 1,
//                   child: Padding(
//                     padding:
//                     const EdgeInsets.only(left: 10).r,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'From Date',
//                           contentPadding:
//                           EdgeInsets.all(5).r,
//                           labelStyle: TextStyle(
//                               color: Colors.grey[400])),
//                       style: GoogleFonts.dmSans(
//                         fontStyle: FontStyle.normal,
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 0.090.sw),
//                 Expanded(
//                   // optional flex property if flex is 1 because the default flex is 1
//                   flex: 1,
//                   child: Padding(
//                     padding:
//                     const EdgeInsets.only(right: 10).r,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'To Date',
//                         contentPadding: EdgeInsets.all(5).r,
//                         labelStyle: TextStyle(
//                             color: Colors.grey[400]),
//                       ),
//                       style: GoogleFonts.dmSans(
//                         fontStyle: FontStyle.normal,
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               // optional flex property if flex is 1 because the default flex is 1
//               flex: 1,
//               child: Padding(
//                 padding:
//                 const EdgeInsets.only(right: 10).r,
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: 'reason',
//                     contentPadding: EdgeInsets.all(5).r,
//                     labelStyle: TextStyle(
//                         color: Colors.grey[400]),
//                   ),
//                   style: GoogleFonts.dmSans(
//                     fontStyle: FontStyle.normal,
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
