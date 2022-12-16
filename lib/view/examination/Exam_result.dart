import 'package:flutter/material.dart';

class ExamResult extends StatefulWidget {
  const ExamResult({super.key});

  @override
  State<ExamResult> createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> {
  List studentName = [
    "Rocky",
    "radhe",
    "dipak",
    "john",
    "daniel",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 245, 255),
      appBar: AppBar(
        title: const Text("Result"),
        // backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ExpandableListView(title: studentName[index]);
        },
        itemCount: studentName.length,
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final String title;

  const ExpandableListView({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExpandableListViewState createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  List result = [
    {
      "subjectname": "hindi",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "english",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "math",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "physics",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "physics",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "physics",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 1.0,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  IconButton(
                      icon: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            expandFlag
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          expandFlag = !expandFlag;
                        });
                      }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: ExpandableContainer(
                expanded: expandFlag,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.3, color: Colors.grey),
                          color: Color.fromARGB(255, 250, 254, 255)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Subject"),
                            Text("Passing Marks"),
                            Text("Marks Obtained"),
                            Text("Result"),
                          ]),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.3, color: Colors.grey),
                                color: Color.fromARGB(255, 250, 254, 255)),
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    result[index]["passingmarks"] ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    result[index]["Marks Obtained"] ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              leading: Text(result[index]["subjectname"] ?? ""),
                              trailing: Text(result[index]["Result"] ?? ""),
                            ),
                          );
                        },
                        itemCount: result.length,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  const ExpandableContainer({
    super.key,
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 360.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: Container(
        child: child,
        // decoration:  BoxDecoration(border:  Border.all(width: 1.0, color: Color.fromARGB(255, 119, 127, 134))),
      ),
    );
  }
}
