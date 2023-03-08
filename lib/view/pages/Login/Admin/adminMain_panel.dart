
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/view/pages/Login/Admin/classes_section/class_admin_panel-screen.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/pta_admin_panel.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/class_attendence_status.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/dated_attence.dart';
import 'package:dujo_website/view/pages/web/admin/dujo_admin_teacher_list.dart';
import 'package:dujo_website/view/pages/web/admin/events_updates.dart';
import 'package:dujo_website/view/pages/web/admin/fees_bills.dart';
import 'package:dujo_website/view/pages/web/admin/meeting_updates.dart';
import 'package:dujo_website/view/pages/web/admin/notices_updates.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../model/create_classModel/create_classModel.dart';
import '../../Login/Admin/teacher_section/add_teacher.dart';

class AdminPage extends StatefulWidget {
  var id;

  AdminPage({required this.id, Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<ClassWiseAttendance> data = [
    ClassWiseAttendance('Mon', 35),
    ClassWiseAttendance('Tue', 28),
    ClassWiseAttendance('Wed', 34),
    ClassWiseAttendance('Thu', 32),
    ClassWiseAttendance('Fri', 40)
  ];
  bool __showContainer = false;
  bool _showContainer = false;
 
  @override
  Widget build(BuildContext context) {
     String classID ='';
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("DuJo"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0XFFE8EAF6),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 191, 212, 209),
                        Color.fromARGB(255, 191, 212, 209),
                      ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                      border: Border.all(width: 2, color: Colors.white)),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //decoration:

                        child: Text(
                          "Admin Dashboard",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width * 1 / 55),
                      child: Container(
                        //eight: screenSize.height,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminTeachersPanelScreen(
                                              id: widget.id),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "Teachers",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminClasses(id: widget.id),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "Classes",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NoticeUpdates(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "Notices",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventsUpdates(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "Events",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FeesBills(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "Fees & Bills",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MeetingUpdates(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "Meetings",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PtaMemberAdmin(id: widget.id),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "PTA",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminTeacherList(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "Online classes",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminTeacherList(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                    text: "Recorded classes",
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.2,
                      height: screenSize.width * 1 / 5,
                      child: Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("SchoolListCollection")
                              .doc(widget.id)
                              .collection("Classes")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                  padding: EdgeInsets.all(20),
                                  itemBuilder: (context, index) {
                                    final data = AddClassesModel.fromJson(
                                        snapshot.data!.docs[index].data());
                                     
                                    return GestureDetector(
                                      onTap: () {
                                        log(widget.id);
                                            log(widget.id);
                                                log(data.id);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return AttendenceDetailsScreen(
                                                schoolId: widget.id,
                                                classID: data.classID,
                                                  );
                                          },
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                               151, 141, 146, 141),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        height: 100,
                                        child: Center(
                                            child: Text(
                                          data.className,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white),
                                        )),
                                      ),
                                    );
                                    
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider();
                                  },
                                  itemCount: snapshot.data!.docs.length);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Column(children: [
                      Container(
                        width: 400,
                        height: 600,
                        child: Visibility(
                            visible: __showContainer,
                            maintainSize: true, //NEW
                            maintainAnimation: true, //NEW
                            maintainState: true, //NEW
                            child: Column(children: [
                              //Initialize the chart widget
                              SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  // Chart title
                                  title: ChartTitle(text: 'Class Attendance'),
                                  // Enable legend
                                  legend: Legend(isVisible: true),
                                  // Enable tooltip
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <
                                      ChartSeries<ClassWiseAttendance, String>>[
                                    LineSeries<ClassWiseAttendance, String>(
                                        dataSource: data,
                                        xValueMapper:
                                            (ClassWiseAttendance sales, _) =>
                                                sales.day,
                                        yValueMapper:
                                            (ClassWiseAttendance sales, _) =>
                                                sales.attendance,
                                        name: 'Attendance',
                                        // Enable data label
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true))
                                  ]),
                            ])),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 60, top: 20, bottom: 80),
                      //   child: Container(
                      //       width: 380,
                      //       height: 240,
                      //       decoration: new BoxDecoration(
                      //           image: new DecorationImage(
                      //         image: new AssetImage("images/graph.png"),
                      //         fit: BoxFit.fill,
                      //       ))),
                      // ),
                    ])
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class ClassWiseAttendance {
  ClassWiseAttendance(this.day, this.attendance);

  final String day;
  final double attendance;
}
