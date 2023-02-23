import 'package:ecom_desgin/Widgets/DropDown_widget.dart';
import 'package:ecom_desgin/Widgets/TextFieldWidget.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/teacher_controller/other_teacher_add_leave_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/other_teacher_leave_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/staff_leave_type_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class TeacherAddUserDialog extends StatefulWidget {


  TeacherAddUserDialog();

  @override
  _TeacherAddUserDialogState createState() => _TeacherAddUserDialogState();
}

class _TeacherAddUserDialogState extends State<TeacherAddUserDialog>
    with SingleTickerProviderStateMixin {
  StaffLeaveRecordController StaffLeaveRecord =
      Get.put(StaffLeaveRecordController());
  AddStaffLeaveRecordController addStaffLeaveRecord =
      Get.put(AddStaffLeaveRecordController());
  StaffLeaveTypeController staffLeaveTypeController =Get.put(StaffLeaveTypeController());
  var pickedRange1;
  var pickedRange2;
  var from_date;
  var to_date;
  var message;
  var student_id;
  var company_key;
  var userfile;
  var id;
  var id1;
  var from_date1;
  var to_date1;
  var show;
  var fileData;
  var staff_id;
  var leave_type_id;
  bool isloading=true;
  bool fileSelected = false;
  bool selectstaff =false;
  List<types.Message> _messages = [];
  var  selectdata1="Select LeaveType";
   List<String> countries1=[];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  late Animation<double> _animation;
  late AnimationController _animationController;
  Future selectDateRange(BuildContext context) async {}
  void studentLeave() {
    print("Staff Leave");
    if (from_date.toString().isNotEmpty) {
      if (to_date.toString().isNotEmpty) {
        if (message.toString().isNotEmpty) {
          fileSelected = true;
          setState(() {});
        } else {
          Get.snackbar(
            "Please Select File",
            "",
            duration: 5
                .seconds, // it could be any reasonable time, but I set it lo-o-ong
            snackPosition: SnackPosition.BOTTOM,
            showProgressIndicator: true,

            isDismissible: true,
            backgroundColor: Colors.lightGreen,
            colorText: Colors.white,
            mainButton:
                TextButton(onPressed: Get.back, child: const Text("Close")),
          );
        }
      } else {
        Get.snackbar(
          "Please Select Description",
          "",
          duration: 5
              .seconds, // it could be any reasonable time, but I set it lo-o-ong
          snackPosition: SnackPosition.BOTTOM,
          showProgressIndicator: true,

          isDismissible: true,
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
          mainButton:
              TextButton(onPressed: Get.back, child: const Text("Close")),
        );
      }

      // _submit();

    } else {
      Get.snackbar(
        "Please Select Content Title",
        "",
        duration:
            5.seconds, // it could be any reasonable time, but I set it lo-o-ong
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,

        isDismissible: true,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
        mainButton: TextButton(onPressed: Get.back, child: const Text("Close")),
      );
    }
  }

  onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {});
  }

  DateTime today = DateTime.now();

  DateFormat currentDate = DateFormat.yMd();
  get dateStr => "${today.day}-${today.month}-${today.year}";
  var box = Hive.box("schoolData");

  @override
  void initState() {

    String dateStr = "${today.day}-${today.month}-${today.year}";
    fromdateController.text = "";
    todateController.text = "";

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    // box.put("fromdateController",fromdateController.text);
    // box.put("todateController",todateController.text);
    // box.put("reasonController",reasonController.text);
    student_id = box.get("student_id");
    company_key = box.get("company_key");
    id = box.get("student_id");
    // from_date = box.get("fromdateController");
    // to_date=box.get("todateController");
    // message=box.get("todateController");
    print("ggggmmmmmmmmddd");
    print(from_date);
    print(student_id);
    print(company_key);
    print(to_date);
    print(message);

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
    // _loadMessages();
    if (staffLeaveTypeController.staffLeaveTypeModel.value?.response.length!=null) {
      staffLeaveTypeController.staffLeaveTypeModel.value?.response.forEach((
          element) {
        var type = '${element.type}';
        countries1.add(type);
      });
    }
  }

  // var pickedRange;
  var usernameController = TextEditingController();
  var fromdateController = TextEditingController();
  var todateController = TextEditingController();
  var reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 0.58.sh,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title:  Text("Add Staff Leave",style: MyGoogeFont.mydmSans),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0,).r,
                      child: RichText(
                        text: TextSpan(
                          text: 'Staff Leave Type',
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                    DropDownWidget(
                    droph: 0.060.sh, 
                    selectText: selectdata1, 
                    item: countries1,
                     isloading: true,
                     empaty: "",
                     onChange: (country) {
                          selectdata1=country!;
                          setState(() {
                            dataset(country);
                          });
                    }, xpand:true,)
                    // Container(
                    //   height: 0.060.sh,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.rectangle,
                    //     border: Border.all(
                    //       color: Colors.grey,
                    //       width: 1.0,
                    //     ),
                    //   ),
                    //   child: DropdownButton(

                    //     isExpanded: true,
                    //     isDense: true,
                    //     iconSize: 35,
                    //     // alignment: Alignment.center,
                    //     value: selectdata1,

                    //     items: countries1.map((country){
                    //       return DropdownMenuItem(
                    //         value: country,
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text(country),
                    //         ),
                    //       );
                    //     }).toList(),
                    //     hint: const Center(
                    //       child: Padding(
                    //         padding: EdgeInsets.all(8.0),
                    //         child: Text("Select LeaveType",style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500)),
                    //       ),
                    //     ),
                    //     onChanged: (country){
                    //       // print("You selected: $country");
                    //       selectdata1=country!;


                    //       setState(() {
                    //         dataset(country);
                    //         // paySlipController.isloding.value=false;
                    //         // isselected=true;
                    //       });
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 1,
                // ),

                //     TextField(
                // controller: usernameController,
                //       decoration: InputDecoration(
                //           labelText: 'UserName',
                //           contentPadding: EdgeInsets.all(5),
                //           labelStyle: TextStyle(
                //             color: Colors.grey[400],
                //           )),
                //       style: GoogleFonts.dmSans(
                //         fontStyle: FontStyle.normal,
                //         fontSize: 15.sp,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      // optional flex property if flex is 1 because the default flex is 1
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5).r,
                        child: TextField(
                            controller: fromdateController,
                            decoration: InputDecoration(
                                labelText: 'From Date',
                                contentPadding: const EdgeInsets.all(5).r,
                                labelStyle:
                                    TextStyle(color: Colors.grey[400])),
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTimeRange? pickedRange =
                                  await showDateRangePicker(
                                      context: context,
                                      
                                      initialDateRange: DateTimeRange(
                                      
                                        start: DateTime.now(),
                                        end: DateTime.now(),
                                      ),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 2),
                                      helpText: 'Select Date Range',
                                      cancelText: 'CANCEL',
                                      confirmText: 'OK',
                                      saveText: 'SAVE',
                                      errorFormatText: 'Invalid format.',
                                      errorInvalidText: 'Out of range.',
                                      errorInvalidRangeText: 'Invalid range.',
                                      fieldStartHintText: 'Start Date',
                                      fieldEndLabelText: 'End Date',
                                      builder: (context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      primaryColor: Colors.blue,
                                      scaffoldBackgroundColor: Colors.grey[50],
                                      dividerColor: Colors.grey,
                                      textTheme: const TextTheme(
                                        bodyMedium:
                                        TextStyle(color: Colors.black),
                                      ),
                                      colorScheme: ColorScheme.fromSwatch().copyWith(

                                        primary: Colors.blue,

                                        onSurface: Colors.black,

                                      ),
                                    ),
                                    child: child!,
                                  );
                                }
                                      );

                              if (pickedRange != null) {
                                print(
                                    pickedRange); //pickedDate output format => 2021-03-10 00:00:00.000
                                DateTimeRange formattedDate = pickedRange;
                                print(formattedDate);
                                setState(() {
                                  fromdateController.text =
                                      MyDateFormat.dateformatmethod1(
                                          '${pickedRange?.start}');
                                  todateController.text =
                                      MyDateFormat.dateformatmethod1(
                                          '${pickedRange?.end}');
                                  from_date = MyDateFormat.dateformatmethod(
                                      '${pickedRange?.start}');
                                  to_date = MyDateFormat.dateformatmethod(
                                      '${pickedRange?.end}');
                                  // fromdateController.text =formatDate(DateTime.parse('${pickedRange?.start}'), [dd, '-', mm, '-', yyyy]);
                                  // todateController.text =formatDate(DateTime.parse('${pickedRange?.end}'), [dd, '-', mm, '-', yyyy]);
                                  print(
                                      "tttttttttttttttttttttttttttgggggggggggggggg");

                                  // from_date=fromdateController.text;
                                  // to_date=todateController.text;

                                  //set output date to TextField value.
                                });
                              }
                              print("444444444444443444333");
                              print(
                                  'picked range ${pickedRange?.start} ${pickedRange?.end} ${pickedRange?.duration.inDays}');

                              // pickedRange1='${pickedRange?.start}';
                              // pickedRange2='${pickedRange?.end}';
                              // print(pickedRange1);
                              // print(pickedRange2);
                            }),
                      ),
                    ),
                    SizedBox(width: 0.030.sw),
                    Expanded(
                      // optional flex property if flex is 1 because the default flex is 1
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5).r,
                        child: TextField(
                          controller: todateController,
                          decoration: InputDecoration(
                            labelText: 'To Date',
                            contentPadding: EdgeInsets.all(5).r,
                            labelStyle: TextStyle(color: Colors.grey[400]),
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
       CustomTextField(hint: 'Reason',controller: reasonController,inputType: TextInputType.text,obscureText: false,onChange: (value){   studentLeave();},),

                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 10).r,
                //   child: TextField(
                //     controller: reasonController,
                //     onChanged: (content) {
                //       studentLeave();
                //     },
                //     decoration: InputDecoration(
                //       labelText: 'Reason',
                //       hintText: show,
                //       contentPadding: EdgeInsets.all(5).r,
                //       labelStyle: TextStyle(color: Colors.grey[400]),
                //     ),
                //     style: GoogleFonts.dmSans(
                //       fontStyle: FontStyle.normal,
                //       fontSize: 15.sp,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Container(
                        height: 0.06.sh,
                        width: 0.10.sw,
                        color: Colors.white,
                        child: FloatingActionButton(
                            child: Icon(Icons.upload_sharp),
                            backgroundColor: Colors.white,
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();

                              if (result != null) {
                                PlatformFile file = result.files.first;

                                print(file.name);
                                print(file.bytes);
                                print(file.size);
                                print(file.extension);
                                print(file.path);
                                userfile = file.path;
                                fileData = file.name.toString();
                                setState(() {});
                              } else {
                                print('No file selected');
                              }
                            }),
                      ),
                    ],
                  ),
                ),
            Row(
  children: [
        const Text("file :- "),
    SizedBox(
      width:180,
      child: Text(fileData??"",
      overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
),
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

                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ElevatedButton(
                      //   onPressed: () {
                      //     selectDateRange(context);
                      //   },
                      //   child: Text('select range'),
                      // ),
                      fileSelected
                          ? Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      isloading=false;
                                    });
                                    // final user = User(
                                    //    "",
                                    //     fromdateController.text,
                                    //     todateController.text,
                                    //     reasonController.text,
                                    //     userfile);
                                    message = reasonController.text;
                           
                                    staff_id = box.get("staff_id");

                                    // widget.addUser(user);
                                    if (fileSelected == true) {
                                  
                                      addStaffLeaveRecord
                                          .AddStaffLeaveRecordapi(
                                              staff_id,
                                              dateStr,
                                              from_date,
                                              to_date,
                                              message,
                                        id1,
                                              company_key,
                                              userfile,
                                      ).then((value){
                                   if(value=="true"){
                                     Navigator.of(context).pop();
                                    isloading=true;
                                   }else{
                                    isloading=true;
                                   }
                                      });

                                      
                                    } else {
                                      show = "Please Enter message";
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.blue),
                                  ),
                                  // Navigator.pop(context, MyRoutes.homeRoute);

                                  child: isloading? Text(
                                    'Submit',
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ):const CircularProgressIndicator(color: Colors.white,)),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                  onPressed: () async {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.grey),
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                    ]),

                // Container(color:Colors.black,height:0.001.sh,width: 0.96.sw,),
              ],
            ),
          ),
        ),
      );
  void dataset(datset1){
    staffLeaveTypeController.staffLeaveTypeModel.value?.response.forEach((element) {
      if(datset1=='${element.type}'){
      selectstaff=true;
     id1=element.id;
      print(id1);
    }});




  }
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
          height: 304,
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
                  child: Text(
                    'Photo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File', style: TextStyle(color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
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
      print("No file selected");
    } else {
      setState(() {});
      result?.files.forEach((element) {
        print(element.name);
      });
      // final message = types.FileMessage(
      //   author: _user,
      //   createdAt: DateTime.now().millisecondsSinceEpoch,
      //   id: const Uuid().v4(),
      //   mimeType: lookupMimeType(result.files.single.path!),
      //   name: result.files.single.name,
      //   size: result.files.single.size,
      //   uri: result.files.single.path!,
      // );

      // _addMessage(message);
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

  daterange() {
    selectDateRange(context);
  }
}
