import 'package:dujo_website/view/pages/Login/Admin/classes_section/class_admin_panel-screen.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/pta_admin_panel.dart';
import 'package:dujo_website/view/pages/web/admin/dujo_admin_teacher_list.dart';
import 'package:dujo_website/view/pages/web/admin/events_updates.dart';
import 'package:dujo_website/view/pages/web/admin/fees_bills.dart';
import 'package:dujo_website/view/pages/web/admin/meeting_updates.dart';
import 'package:dujo_website/view/pages/web/admin/notices_updates.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Login/Admin/teacher_section/add_teacher.dart';


class AdminPage extends StatefulWidget {
  var id;
   AdminPage(  { required this.id,  Key? key}) : super(key: key);

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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("DuJo"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFF26A69A),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      gradient: LinearGradient(colors: [
                        Color(0xFF26A69A),
                        Color.fromARGB(255, 9, 49, 45),
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
                                      builder: (context) => AdminTeachersPanelScreen(id: widget.id),
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
                                      builder: (context) => AdminClasses(id: widget.id),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomButton(
                                      text: "Classes", )),
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
                                      text: "Notices",)),
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
                                      text: "Events", )),
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
                                      text: "Fees & Bills", )),
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
                                      text: "Meetings", )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PtaMemberAdmin(id: widget.id),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child:
                                      CustomButton(text: "PTA", )),
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
                                      text: "Online classes", )),
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
                                      text: "Recorded classes", )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width * 1 / 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("LKG"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("UKG"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 1"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 2"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 3"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 4"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 5"),
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              // ignore: sized_box_for_whitespace
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 6"),
                                    )),
                              ),
                              // ignore: sized_box_for_whitespace
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 7"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 8"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 9"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 10"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 243, 166),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: const Text("Class 11"),
                                    )),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          __showContainer = !__showContainer;
                                        });
                                      },
                                      child: Text("Class 12"),
                                    )),
                              ),
                            ],
                          ),
                        ],
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
