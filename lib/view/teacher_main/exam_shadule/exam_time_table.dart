import 'package:ecom_desgin/view/examination/Exam_time_table.dart';
import 'package:flutter/material.dart';


class TeacherExamTimeTable extends StatefulWidget {
  const TeacherExamTimeTable({Key? key}) : super(key: key);

  @override
  State<TeacherExamTimeTable> createState() => _TeacherExamTimeTableState();
}

class _TeacherExamTimeTableState extends State<TeacherExamTimeTable> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ExamTimeTable(),);
  }
}
