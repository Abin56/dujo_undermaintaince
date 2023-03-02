import 'package:dujo_website/view/pages/web/admin/dujo_admin_teacher_list.dart';
import 'package:dujo_website/view/pages/web/class_teacher/add_student.dart';
import 'package:dujo_website/view/pages/web/class_teacher/class%20_notices.dart';
import 'package:dujo_website/view/pages/web/class_teacher/class_event.dart';
import 'package:dujo_website/view/pages/web/class_teacher/update_student.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_dark_button.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_n_container.dart';
import 'package:flutter/material.dart';

 

class ClassTeacherAdmin extends StatefulWidget {
  const ClassTeacherAdmin({super.key});

  @override
  State<ClassTeacherAdmin> createState() => _ClassTeacherAdminState();
}

class _ClassTeacherAdminState extends State<ClassTeacherAdmin> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("DuJo"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 32, 189, 142),
            // Color.fromARGB(255, 166, 38, 155),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 32, 189, 142),
                        Color.fromARGB(255, 38, 44, 10),
                      ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                      border: Border.all(width: 2, color: Colors.white)),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //decoration:

                        child: Text(
                          "Class teacher Dashboard",
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
                                      builder: (context) => AddStudentTea(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                    onTap: () {},
                                    text: "Add Student",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateStudentTea(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Update Student", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => PtaMemberAdmin(),
                                //     ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Chat with Parents", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => NoticeUpdates(),
                                //     ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Upload TimeTable", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => EventsUpdates(),
                                //     ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Upload ProgressReport",
                                      onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ClassEventsTeacher(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Upload Events", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ClassNoticeTeacher(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Upload Notice", onTap: () {})),
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
                                  child: CustomNewContainer(
                                      text: "Live classes", onTap: () {})),
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
                                  child: CustomNewContainer(
                                      text: "Recorded classes", onTap: () {})),
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
                                child: CustomDarkButton(
                                    text: "Student 1", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 2", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 3", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 3", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 4", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 5", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 6", onPressed: () {}),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 7", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 8", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 9", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 10", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 11", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 12", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Student 13", onPressed: () {}),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 50),
                      child: Container(
                        height: 500,
                        width: 400,
                        color: Color.fromARGB(113, 41, 6, 6),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
