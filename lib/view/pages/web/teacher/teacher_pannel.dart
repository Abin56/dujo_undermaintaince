import 'package:dujo_website/view/pages/web/admin/dujo_admin_teacher_list.dart';
import 'package:dujo_website/view/pages/web/teacher/exams_and_results.dart';
import 'package:dujo_website/view/pages/web/teacher/study_material.dart';
import 'package:dujo_website/view/pages/web/teacher/subject_teacher.dart';
import 'package:dujo_website/view/pages/web/teacher/timetable_teacher.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_dark_button.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_tea_container.dart';
import 'assignment_and_project.dart';

class TeacherPannelAdmin extends StatefulWidget {
  const TeacherPannelAdmin({super.key});

  @override
  State<TeacherPannelAdmin> createState() => _TeacherPannelAdminState();
}

class _TeacherPannelAdminState extends State<TeacherPannelAdmin> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("DuJo"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 73, 224, 27),
            // color: Color.fromARGB(255, 32, 189, 142),
            // Color.fromARGB(255, 166, 38, 155),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 68, 166, 38),
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
                          "Teacher Dashboard",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
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
                                      builder: (context) => TimetableTeacher(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomTeaContainer(
                                    onTap: () {},
                                    text: "TimeTable",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubjectTeacher(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomTeaContainer(
                                      text: "Subject", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => UpdateStudentTea(),
                                //     ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomTeaContainer(
                                      text: "Teaching Notes", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StudyMaterialTea(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomTeaContainer(
                                      text: "Study Material Upload",
                                      onTap: () {})),
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
                                  child: CustomTeaContainer(
                                      text: "Upload ProgressReport",
                                      onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExamsAndResult(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomTeaContainer(
                                      text: "Exams and Results", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AssignmentProjects(),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomTeaContainer(
                                      text: "Assiginment and Projects",
                                      onTap: () {})),
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
                                  child: CustomTeaContainer(
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
                                  child: CustomTeaContainer(
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
                                    text: "Class 1", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                  classID: '',
                                    text: "Class 2", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 3", onPressed: () {}),
                              ),
                              // Container(
                              //   height: screenSize.width * 1 / 13,
                              //   width: screenSize.width * 1 / 6,
                              //   child: CustomDarkButton(
                              //       text: "Class 3", onPressed: () {}),
                              // ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 4", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 5", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 6", onPressed: () {}),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 7", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 8", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 9", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 10", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 11", onPressed: () {}),
                              ),
                              Container(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: "Class 12", onPressed: () {}),
                              ),
                              // Container(
                              //   height: screenSize.width * 1 / 13,
                              //   width: screenSize.width * 1 / 6,
                              //   child: CustomDarkButton(
                              //       text: "Student 13", onPressed: () {}),
                              // ),
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
