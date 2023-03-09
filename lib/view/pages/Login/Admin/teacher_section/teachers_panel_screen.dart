import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/view/pages/web/admin/dujo_admin_teacher_list.dart';
import 'package:dujo_website/view/pages/web/class_teacher/add_student.dart';
import 'package:dujo_website/view/pages/web/class_teacher/class%20_notices.dart';
import 'package:dujo_website/view/pages/web/class_teacher/class_event.dart';
import 'package:dujo_website/view/pages/web/class_teacher/update_student.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_dark_button.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_n_container.dart';
import 'package:flutter/material.dart';

import '../../../../../model/create_classModel/create_classModel.dart';

 

class ClassTeacherAdmin extends StatefulWidget {
  var schoolID;
   var teacherID;
 
   ClassTeacherAdmin({
   required this.schoolID,
   required this.teacherID,


    super.key});

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
                                      builder: (context) => AddStudentTea(schoolID: widget.schoolID,teacherID: widget.teacherID),
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
                      child: Center(
                        child: Container(
                          height: 1000,
                          width: double.infinity,
                          child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("SchoolListCollection").doc(widget.schoolID).collection("Classes").snapshots(),
                          builder: (context, snapshot) {
                          if (snapshot.hasData) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = AddClassesModel.fromJson(snapshot.data!.docs[index].data());
                            return   SizedBox(
                                height: screenSize.width * 1 / 13,
                                width: screenSize.width * 1 / 6,
                                child: CustomDarkButton(
                                    text: data.className, onPressed: () {}),
                              );
                          }, separatorBuilder: (context, index) {
                          return  Divider();
                          }, itemCount:snapshot.data!.docs.length );
                          
                          }else{
                          return Center(child: CircularProgressIndicator.adaptive(),);
                          }
                                            },),
                        ),
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
