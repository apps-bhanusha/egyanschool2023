import 'dart:async';
import 'package:ecom_desgin/Widgets/footer_widget.dart';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/attendance_controller.dart';
import 'package:ecom_desgin/controller/force_logout.dart';
import 'package:ecom_desgin/controller/getexamsSchedule1_controller.dart';
import 'package:ecom_desgin/controller/getexamsSchedule_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/home_word_controller.dart';
import 'package:ecom_desgin/controller/notice_controller.dart';
import 'package:ecom_desgin/controller/parent_Student_List_Controller.dart';
import 'package:ecom_desgin/controller/parent_login.dart';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/controller/student_login_update_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_by_Student_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final AttendanceController studentattendance = Get.put(AttendanceController());
  var  isloading=false ;
late  int? i= noticController.noticlist.value?.response?.length;
  final StudentLoginUpdateController studentLoginUpdateControllers =Get.put( StudentLoginUpdateController());

  GetexamsSchedule1Controller getexamview1=Get.put(GetexamsSchedule1Controller());
  GetexamsScheduleController getexamview=Get.put(GetexamsScheduleController());

  ParentLoginController parentLoginController=Get.put(ParentLoginController());
      final ForceLogout forceLogout = Get.put(ForceLogout());
  
  UserNameController userNameController=Get.put(UserNameController());
  GetTeacherByStudentController teacherbystudentController=Get.put(GetTeacherByStudentController());
  final ParentStudentListController parentStudentListController =  Get.put(ParentStudentListController());
  final HomeWorkController _homeWorkController = Get.put(HomeWorkController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());
  final NoticController noticController = Get.put(NoticController());
  final GetSchoolSettingController _schoolsetting =
  Get.put(GetSchoolSettingController());

  // allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"]==0? (int.parse(_allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"].toString())) / 100:(int.parse(_allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"].toString())) / 100
  List<UserNameController> dataModel = [];
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller1;
  late Animation<Offset> _Animation;
  double percent = 1.0;
  var  studenttotalfees;
  var studentduefees;
  var schoolname;
  var company_key;
  var session;
  late String urlimage;
  int totalSecs = 90;
  int secsRemaining = 90;
  double progressFraction = 0.6;
  int percentage = 0;
  var username;
  var password;
 var present;

  // double progressFraction = 0.0;
  //
  // double percentage = 0;
  late Timer timer;
  get progress => progressFraction;
  DateTime now = DateTime.now();
  late int lastday = DateTime(now.year, now.month + 1, 0).day;
  late int days =lastday ;
  double progressFraction1 = 0.0;
  double percentage1 = 0;
  late Timer timer1;
  get progress1 => progressFraction1;
  // late bool _loading;
  // late double _progressValue;
  var box = Hive.box("schoolData");



  @override
  void initState() {
     company_key = box.get("company_key");
    schoolname = box.get("schoolname");
   session = box.get("session");
    _schoolsetting.GetSchoolSettingapi(company_key,);
   
    studenttotalfees = studentProfileController.studentProfileModel.value?.response.fee.totalAmount;
    studentduefees = studentProfileController.studentProfileModel.value?.response.fee.totalBalanceAmount;


  // alld=(int.parse(_allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"])) / 100;
  //       print("444mmmmmmmmmmmmmm4444");
  //      print(alld);
// print('${ApiUrl.imagesUrl}${studentpro}');
//     print(studentname);
    // _loading = false;
    // _progressValue =double.parse(_allsetController.SchoolIdControllerList[0]["response"][0]["fee"]["total_amount"]);
    // timer = Timer.periodic(Duration(milliseconds: 20), (_) {
    //   if(secsRemaining == 40){
    //     return;
    //   }
    //   setState(() {
    //     secsRemaining -= 1;
    //     progressFraction = (totalSecs - secsRemaining) / totalSecs;
    //     percentage = (progressFraction*100).floor();
    //   });
    // });
    // timer = Timer.periodic(Duration(milliseconds: 100), (_) {
    //   if(DueFees == TotalFees){
    //     return ;
    //   }
    //   setState(() {
    //     DueFees -= 1;
    //     progressFraction = (TotalFees - DueFees) / TotalFees;
    //     percentage = (progressFraction*100).roundToDouble();
    //   });
    // });

    // timer1 = Timer.periodic(Duration(milliseconds: 100), (_) {
    //   if(present == days){
    //     return ;
    //   }
    //   setState(() {
    //     present -= 1;
    //     progressFraction1 = (present*lastday) /present;
    //     // percentage1 = (progressFraction*100).floor() as double;
    //   });
    // });

    super.initState();
    // progressFraction = studentduefees*100/studenttotalfees;
    //     percentage = (progressFraction*100).floor();

    // _updateProgress();
    //
    // setState(() {
    //   _loading = !_loading;
    //   _updateProgress();
    // });

    // _homeWorkController.homeworkapi(id);

    username = box.get("username");
    password =box.get("password");
    // studentLoginUpdateControllers.apicallpost(username,password);
    company_key = box.get("company_key");
       var  student_id = box.get("student_id");
    
       var  student_login = box.get("student_login");
        // studentLoginUpdateControllers.loadingstudentLoginData.value=true;
       if(student_login=="student_login"){
         studentProfileController.studentProfileApi(student_id);      
               forceLogout.forceLogout(student_id, context);
         company_key = box.get("company_key");
         getexamview1.loadingGetexamsSchedule1.value = false;
         getexamview1.GetexamsSchedule1api(company_key, 0,studentProfileController.studentProfileModel.value?.response.studentId);
       }
var  role_flag = box.get("role_flag"); 
if(role_flag.toString()=="P"){
     var parent_id = box.get("parent_id").toString();
       forceLogout.forceLogout(parent_id, context);


}
    // teacherbystudentController.GetTeacherByStudentapi(company_key, studentProfileController.studentProfileModel.value?.response.studentId.toString());

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.1, 0.0))
            .animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        ));
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..repeat(reverse: true);
    _Animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.1, 0.0))
        .animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.linear,
    ));
    // _controller.repeat(reverse: true);
    // _controller =  AnimationController(vsync: this, duration: Duration(seconds: 6));
    // colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    // sizeAnimation = Tween<double>(begin: 400.0, end: 400.0).animate(controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();

    super.dispose();
  }

  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () {
        return Future.value(true); // or return Future.value(false);
      },
      child: RefreshIndicator(
        onRefresh: () async {
          const AlwaysScrollableScrollPhysics();
          setState(() {
    
            username = box.get("username");
            password =box.get("password");
            // studentLoginUpdateControllers.apicallpost(username,password);

    
            // teacherbystudentController.GetTeacherByStudentapi(company_key, studentProfileController.studentProfileModel.value?.response.studentId);
    
          });
    
          await Future.value({
    
            Duration(seconds: 3),
    
          });
        },
        child: SafeArea(
          child: SideMenu(
            background: Colors.blue,
            key: _sideMenuKey,
            menu: buildMenu(),
            type: SideMenuType.shrikNRotate,
            onChange: (isOpened) {
              setState(() => isOpened = isOpened);
           var  role_flag = box.get("role_flag"); 
if(role_flag.toString()=="P"){
     var parent_id = box.get("parent_id").toString();
       forceLogout.forceLogout(parent_id, context);
}   
          var  student_id = box.get("student_id");
          var  student_login = box.get("student_login");
       if(student_login=="student_login"){
         studentProfileController.studentProfileApi(student_id);      
        forceLogout.forceLogout(student_id, context);

       }
            },
            child: IgnorePointer(
              ignoring: isOpened,
              child: Scaffold(
                appBar: AppBar(
                  // centerTitle: true,
                  leading: IconButton(
    
                    icon: const Icon(Icons.menu,),
    
                    onPressed: () => toggleMenu(),
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).primaryColor,
                  // iconTheme: IconThemeData(color: Colors.black),
                  title: Row(
                    children: [
                      SizedBox(
                          width: 0.45.sw,
                          child:  Text(
                            schoolname??"",
                            // _schoolsetting.GetSchoolSettingControllerList[0]["response"]["name"],
                            style: MyGoogeFont.mydmSans1,
                            overflow: TextOverflow.ellipsis,
                          )
    
                      ),
    
    
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 10).r,
                      child: Column(
                        children: [
                          Text(
                            'Session',
                            style: MyGoogeFont.mydmSans2,
                          ),
                          Text(
                            session??"",
                            // _schoolsetting.GetSchoolSettingControllerList[0]["response"]["session"],
                            style: MyGoogeFont.mydmSans2,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuButton<int>(
                      itemBuilder: (context)  {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem(value: 0, child: const Text('Logout'),
                           onTap:() async { await SessionManager().remove("name");
                        // await SessionManager().remove("parentlogin");
                            Get.offAllNamed(RoutesName.schoolId);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("logout", style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              ),
                                backgroundColor: Colors.white,
                              ),
                            );
                            }
                            ),
                          const PopupMenuItem(child: Text('about'), value: 1),
                        ];
                      },
                    ),
                  ],
                ),
                body: Obx(
        () =>
          // studentLoginUpdateControllers.loadingstudentLoginData.value ? 
      studentProfileController.isloading.value ?(
                 Column(
                    children: [
                      Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(left: 0, right: 0).r,
                          child: ClipPath(
                            clipper: ClipPathClass(),
                            child: SizedBox(
                              width: double.infinity,
                              height: 0.220.sh,
                              child: Image.asset(
                                "assets/images/bannerimage.jpeg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 70.0).r,
                          child: Stack(
                            children: <Widget>[
                              Card(
                                child: SizedBox(
                                  height: 0.150.sh,
                                  width: 0.85.sw,
                                ),
                              ),
                              Positioned(
                                top: 0.005.sh,
                                left: 0.33.sw,
                                right: 0.31.sw,
                                child: FractionalTranslation(
                                  translation: Offset(0.0, -0.5),
                                  child: Align(
                                    alignment: FractionalOffset(0.5, 0.5),
                                    child:
                                  //  studentProfileController.studentProfileModel.value?.response.profileimage==null?  CachedNetworkImage(
                                  //     placeholder: (context, url) => CircleAvatar(
                                  //       maxRadius: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width +
                                  //           52,
                                  //       backgroundImage: const AssetImage(
                                  //         "assets/images/user1.png",
                                  //       ),
                                  //     ),
                                  //     imageUrl: studentProfileController.studentProfileModel.value?.response.profileimage!=null?  '${ApiUrl.imagesUrl.toString()}${studentProfileController.studentProfileModel.value?.response.profileimage}':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU"
                                  //    ):s


                                         CircleAvatar(
                                             maxRadius: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width +
                                                           39,
                                          minRadius: 20,
                                          foregroundImage: "${studentProfileController.studentProfileModel.value?.response.profileimage}"!="null"?
                                                                     NetworkImage("${ApiUrl.imagesUrl.toString()}${studentProfileController.studentProfileModel.value?.response.profileimage}")
                                                                  :  NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
                                                                   ,
                                                                     // radius: 54.0,
                                                                     backgroundImage:
                                                                   NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
                                                                   )


                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0.33.sw,
                                top: 0.080.sh,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print("all");
                                      },
                                      child:  Text(
                                        '${studentProfileController.studentProfileModel.value?.response.name}',
                                        // _allsetController.SchoolIdControllerList[0]
                                        //         ["response"][0]["name"] ??
                                        //     "",
                                        style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
    
                                    InkWell(
                                      onTap: () {
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            '${studentProfileController.studentProfileModel.value?.response.responseClass} ${studentProfileController.studentProfileModel.value?.response.section}',
                                            // _allsetController.SchoolIdControllerList[0]
                                            // ["response"][0]["class"] ??
                                            //     "",
    
                                            style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
    
    
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 0.010.sh,
                      ),
                       GestureDetector(
                                onTap: () => {
    
                                  Get.toNamed(RoutesName.dashboard),
                                },
                        child: Container(
                          color: Colors.blue,
                          height: 0.080.sh,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0.001.sh,
                                left: 0.06.sw,
                                child: SlideTransition(
                                  position: _offsetAnimation,
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                    size: 52.sp,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0.10.sw,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 0.50.sh,
                                  ),
                                  child: SlideTransition(
                                    position: _Animation,
                                    child: Icon(
                                      Icons.arrow_right,
                                      color: Colors.white,
                                      size: 55.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0.22.sw,
                                top: 0.025.sh,
                                child: Text(
                                  "Tap Here For E-GYAN Services",
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.010.sh,
                      ),
                      noticController.showDataList.isNotEmpty? Obx(()=>
                         noticController.isloading.value? SizedBox(
                            height: 0.08.sh,
                            // width: 0.500.sw,
                            child:Card(
                              color: Color.fromARGB(255, 134, 217, 248),
                              child: Center(
                                child: ScrollLoopAutoScroll(
                                  duration: Duration(seconds: 200),
                                  delay: Duration(seconds: 1),
                                  // delayAfterScrollInput: Duration(seconds: 10),
                                  enableScrollInput: true,
                                  scrollDirection: Axis.horizontal,
    
                                  child: Obx(()=>
                                  noticController.isloading.value?
                                   Row(
                                      children: [
                                        for(var i=0; i<noticController.showDataList[0]["response"].length; i++)
                                  Obx(()=>
                                  noticController.isloading.value?
                                    Text(
    
    
                                       Bidi.stripHtmlIfNeeded ('${ noticController.isloading.value?noticController.showDataList[0]["response"][i]["message"].toString().capitalizeFirst:""}' ),
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
    
    
                                 ):Text(""),
                                   ),
    
                                      ],
                                    ):Text(""),
                                  ),
                                ),
                              ),
                            )
                        ):CircularProgressIndicator(),
                      ): SizedBox(
                          height: 0.08.sh,
                          // width: 0.500.sw,
                          child:Card(
                            color: Color.fromARGB(255, 134, 217, 248),
                            child: Center(
                              child: ScrollLoopAutoScroll(
    
                                scrollDirection: Axis.horizontal,
    
                                child: Row(
                                  children: [
                                    Text(
                                       "",
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
    
    
                                  ],
                                ),
                                ),
                              ),
                            ),
                          ),
    
    
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            color: Color.fromARGB(255, 134, 217, 248),
                            elevation: 10,
                            child: Column(
                              children: [
                                Text(
                                  "Total Fees",
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.14.sh,
                                  width: 0.30.sw,
                                  child: LiquidLinearProgressIndicator(
    
                                    value:studentProfileController.studentProfileModel.value?.response.fee.totalAmount!=null?double.parse('${studentProfileController.studentProfileModel.value?.response.fee.totalAmount}')/double.parse('${studentProfileController.studentProfileModel.value?.response.fee.totalAmount}'):0,// Defaults to 0.5.
                                    valueColor: const AlwaysStoppedAnimation(
                                      Color.fromARGB(255, 124, 200, 241),
                                    ), // Defaults to the current Theme's accentColor.
                                    backgroundColor: const Color.fromARGB(
                                        255,
                                        246,
                                        243,
                                        243), // Defaults to the current Theme's backgroundColor.
                                    borderColor: Colors.red,
                                    borderWidth: 0.0,
                                    borderRadius: 12.0,
    
                                    direction: Axis.vertical,
                                    // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                    center: Text('${studentProfileController.studentProfileModel.value?.response.fee.totalAmount}',
                                      // _allsetController.SchoolIdControllerList[0]["response"][0]["fee"]["total_amount"].toString(),
    
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
    
                              ],
                            ),
                          ),
                          Card(
                            color: const Color.fromARGB(255, 134, 217, 248),
                            elevation: 10,
                            child: Column(
                              children: [
                                Text(
                                  "Due Fees",
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.14.sh,
                                  width: 0.30.sw,
                                  child: LiquidLinearProgressIndicator(
                                    value: studentProfileController.studentProfileModel.value?.response.fee.totalBalanceAmount!=null?(int.parse('${studentProfileController.studentProfileModel.value?.response.fee.totalBalanceAmount}',)) / int.parse('${studentProfileController.studentProfileModel.value?.response.fee.totalAmount}'):0, // Defaults to 0.5.
                                    valueColor: const AlwaysStoppedAnimation(
                                      // DueFees
                                      //     ? Color.fromARGB(255, 91, 167, 230)
                                      Color.fromARGB(255, 228, 97, 87),
                                    ), // Defaults to the current Theme's accentColor.
                                    backgroundColor: const Color.fromARGB(
                                        255,
                                        246,
                                        243,
                                        243), // Defaults to the current Theme's backgroundColor.
                                    borderColor: Colors.red,
                                    borderWidth: 0.0,
                                    borderRadius: 12.0,
    
                                    direction: Axis.vertical,
                                    // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                    center:
                                    Text(
                                      '${studentProfileController.studentProfileModel.value?.response.fee.totalBalanceAmount}',
                                      // _allsetController.SchoolIdControllerList[0]["response"][0]["fee"]["total_balance_amount"].toString(),
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
    
                              ],
                            ),
                          ),
                          Card(
                            color: const Color.fromARGB(255, 134, 217, 248),
                            elevation: 10,
                            child: Column(
                              children: [
                                Text(
                                  "Attendance",
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
    
                                SizedBox(
                                  height: 0.14.sh,
                                  width: 0.30.sw,
                                  child: LiquidLinearProgressIndicator(
                                    value: studentProfileController.studentProfileModel.value?.response.attandance.present!=null?(int.parse('${studentProfileController.studentProfileModel.value?.response.attandance.present}')) / days:0,// Defaults to 0.5.
                                    valueColor: const AlwaysStoppedAnimation(
                                        Color.fromARGB(255, 144, 212,
                                            146)), // Defaults to the current Theme's accentColor.
                                    backgroundColor: const Color.fromARGB(
                                        255,
                                        246,
                                        243,
                                        243), // Defaults to the current Theme's backgroundColor.
                                    borderColor: Colors.red,
                                    borderWidth: 0.0,
                                    borderRadius: 12.0,
    
                                    direction: Axis.vertical,
                                    // The directioncent% the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                    center:
                                    Text(
                                      '${studentProfileController.studentProfileModel.value?.response.attandance.present}',
                                      // _allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"]??"",
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
    
                              ],
                            ),
                          ),
                        ],
                      ),
                      Obx(()=>
                        getexamview1.loadingGetexamsSchedule1.value?SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0).r,
                            child: Row(
                              children: [
                                for (var i = 0; i <getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"].length; i++)
                                  InkWell(
                                    onTap: (){
                                      getexamview.GetexamsScheduleapi(company_key, getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][i]["exam_group_id"]);
                                      getexamview.loadingGetexamsSchedule.value=false;
                                      Get.toNamed(RoutesName.examiTimeDetial);
                                    },
                                    child: Card(
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Obx(()=>getexamview1.loadingGetexamsSchedule1.value?
                                               Text(
                                                 getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][i]["exam_group_name"]??"",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ):CircularProgressIndicator(),
                                            ),
                                            SizedBox(
                                              height: 0.015.sh,
                                            ),
                        Obx(()=>getexamview1.loadingGetexamsSchedule1.value?
                                           Text(
                                               getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][i]["exam"]??"",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.lightBlue,
                                                ),
                                              ):CircularProgressIndicator(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ):Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  )
                ):Center(child: CircularProgressIndicator( color: Colors.blue,))
                // :Center(child: CircularProgressIndicator()),
              ),
                bottomNavigationBar:const FooterWidget() 
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      child: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child: Obx(() => _schoolsetting.loadingimage.value
                          ? Image.network(
                        _schoolsetting.GetSchoolSettingControllerList[0]["response"]["image"],
                        width: 100,
                        height: 100,
                      )
                          : const CircularProgressIndicator())),
                  const SizedBox(height: 16.0),
                  Obx(() => _schoolsetting.loadingimage.value
                      ? Text(
                    _schoolsetting.GetSchoolSettingControllerList[0]
                    ["response"]["name"],
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                      : const Text("")),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {

                  Get.toNamed(RoutesName.dashboard);
                },
                leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
                title: const Text("Home"),
                textColor: Colors.white,
                dense: true,
              ),
            ),

 Visibility(
    visible:parentLoginController.parentLogin.value ,
  child:   ListTileTheme(
                dense: true,
    
                child:parentStudentListController
                                          .parentSListModel.value!=null? ExpansionTile(
    
                  collapsedIconColor: Colors.white,
                  textColor: Colors.white,
                  title: Text(
                    "Select Student",
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 14.sp,
    
                      color: Colors.white,
                    ),
                  ),
                  leading: const Icon(Icons.book_outlined,
                      size: 20.0, color: Colors.white),
    
                  childrenPadding: EdgeInsets.only(left: 60), //children padding
                  children: [
                 Obx(() =>  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                        itemCount: parentStudentListController
                                          .parentSListModel.value?.response!=null ?parentStudentListController
                                          .parentSListModel.value?.response.length:0,
                    itemBuilder: (context, index) {
                    return   ListTile(
                        title:  Text( "${ parentStudentListController
                                          .parentSListModel.value?.response?[index]?.name}",
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),),
                         onTap: () {
                   studentLoginUpdateControllers.loadingstudentLoginData.value=true;
                    studentProfileController.isloading.value=false;
                            studentProfileController.studentProfileApi(parentStudentListController
                                          .parentSListModel.value?.response[index].studentId);

                                Get.toNamed(RoutesName.home,);  
                           toggleMenu(); 
                         },
                    );
                  },),)
    
                   
    
                    //more child menu
                  ],
                ):const SizedBox(),
              ),
),

            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.profile);
                },

                leading: const Icon(Icons.verified_user,
                    size: 20.0, color: Colors.white),
                title: const Text("Profile"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.attendance);

                  //
                  // if( studentattendance.AttendanceControllerList[0]["status"]==true){
                  //
                  // }


                },
                leading: const Icon(Icons.present_to_all,
                    size: 20.0, color: Colors.white),
                title: const Text("Attendance"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.fees);
                },
                leading: const Icon(Icons.monetization_on,
                    size: 20.0, color: Colors.white),
                title: const Text("Fees"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.timetable);
                },
                leading: const Icon(Icons.av_timer_rounded,
                    size: 20.0, color: Colors.white),
                title: const Text("Class Time Table"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {

                    Get.toNamed(RoutesName.lession);


                },
                leading: const Icon(Icons.play_lesson_outlined,
                    size: 20.0, color: Colors.white),
                title:  Text("Syllabus Status"),

                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            //  ListTile(
            //   onTap: () { Get.toNamed(RoutesName.syllabus);},
            //   leading:
            //       const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
            //   title: const Text("Syllabus"),
            //   textColor: Colors.white,
            //   dense: true,

            //   // padding: EdgeInsets.zero,
            // ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.homeWork),
                leading:
                const Icon(Icons.home_work, size: 20.0, color: Colors.white),
                title: const Text("Home Work"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            ListTileTheme(
              dense: true,

              child: ExpansionTile(

                collapsedIconColor: Colors.white,
                textColor: Colors.white,
                title: Text(
                  "Exmaination",
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,

                    color: Colors.white,
                  ),
                ),
                leading: const Icon(Icons.book_outlined,
                    size: 20.0, color: Colors.white),

                childrenPadding: EdgeInsets.only(left: 60), //children padding
                children: [
                  SizedBox(
                    height: 0.052.sh,
                    child: ListTile(

                        title:  Text("Exam Time ",
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,

                            color: Colors.white,
                          ),),
                        onTap:(){
                          getexamview1.loadingGetexamsSchedule1.value=false;
                            Get.toNamed(RoutesName.examination);

                        }
                    ),
                  ),

                  SizedBox(
                    height: 0.062.sh,
                    child: ListTile(
                        title:
                        Text("Result",  style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,

                          color: Colors.white,
                        ),),
                        onTap:(){

                          Get.toNamed(RoutesName.examresult);
                        }
                    ),
                  ),

                  //more child menu
                ],
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.downloadAll),
                leading:
                const Icon(Icons.download, size: 20.0, color: Colors.white),
                title: const Text("Download"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.062.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.busRoute),
                leading: const Icon(Icons.route, size: 20.0, color: Colors.white),
                title: const Text("Bus Route"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: const ListTile(
                // onTap: () => Get.toNamed(RoutesName.chatPage),
                leading: Icon(Icons.chat, size: 20.0, color: Colors.white),
                title: Text("Chat"),
                textColor: Colors.grey,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.notification),
                leading: const Icon(Icons.notifications,
                    size: 20.0, color: Colors.white),
                title: const Text("Notification",),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: (){
                 if(teacherbystudentController.GetTeacherByStudentControllerList!=null){
                  Get.toNamed(RoutesName.teacherreview);}},
                leading: const Icon(Icons.rate_review_rounded,
                    size: 20.0, color: Colors.white),
                title: const Text("Teacher Review"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.leavestatus),
                leading: const Icon(Icons.holiday_village_sharp,
                    size: 20.0, color: Colors.white),
                title: const Text("Leave Status"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),

            SizedBox(
              height: 0.05.sh,
            ),

          ],
        ),
      ),
    );
  }

// void _updateProgress() {
//   const oneSec = const Duration(seconds: 1);
//   new Timer.periodic(oneSec, (Timer t) {
//     setState(() {
//       print('${ApiUrl.imagesUrl}${studentpro}');
//
//     });
//   });
// }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 0.0);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}