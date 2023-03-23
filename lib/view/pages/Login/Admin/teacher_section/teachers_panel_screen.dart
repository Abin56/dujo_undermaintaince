import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/view/pages/Login/Admin/guardian-section/add_guardian.dart';
import 'package:dujo_website/view/pages/Login/Admin/parents-section/add_parent.dart';
import 'package:dujo_website/view/pages/web/admin/dujo_admin_teacher_list.dart';
import 'package:dujo_website/view/pages/web/class_teacher/add_student.dart';
import 'package:dujo_website/view/pages/web/class_teacher/class%20_notices.dart';
import 'package:dujo_website/view/pages/web/class_teacher/class_event.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_dark_button.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_n_container.dart';
import 'package:flutter/material.dart';

import '../../../../../model/create_classModel/create_classModel.dart';


import 'manage_teachers/all_class_teachers.dart';


class ClassTeacherAdmin extends StatefulWidget {
  var schoolID;
  var teacherID;
  var teacherEmail;

  ClassTeacherAdmin({
    required this.schoolID,
    required this.teacherID,
    super.key,
    required this.teacherEmail,
  });

  @override
  State<ClassTeacherAdmin> createState() => _ClassTeacherAdminState();
}

class _ClassTeacherAdminState extends State<ClassTeacherAdmin> {
  String teacherClassId = '';

  TextEditingController _subjectController = TextEditingController();


  @override
  void initState() {
    getTeacherDetails();
    super.initState();
  }

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
                              onTap: () async {
                                await submitSubject(
                                    context, _subjectController);
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                    onTap: () {},
                                    text: "Add Subjects",
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddStudentTea(
                                          schoolID: widget.schoolID,
                                          teacherIDE: widget.teacherEmail),
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
                                      builder: (context) =>
                                          AddParent(schoolID: widget.schoolID),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Add Parents", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllClassesListViewForTeacher(
                                            schoolID: widget.schoolID,
                                            classID: teacherClassId,
                                            teacherID: '',
                                          ),
                                          ),
                                );
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Manage Teachers", onTap: () {})),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddGuardian(
                                          schoolId: widget.schoolID),
                                    ));
                              },
                              child: Container(
                                  height: screenSize.width * 1 / 13,
                                  width: screenSize.width * 1 / 3,
                                  child: CustomNewContainer(
                                      text: "Add Guradian", onTap: () {})),
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
                                      builder: (context) => ClassEventsTeacher(
                                        classId: teacherClassId,
                                        schoolId: widget.schoolID,
                                      ),
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
                                      builder: (context) => ClassNoticeTeacher(
                                        classId: teacherClassId,
                                        schoolId: widget.schoolID,
                                      ),
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
                          child: FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection("SchoolListCollection")
                                .doc(widget.schoolID)
                                .collection("Classes")
                                .where('classIncharge',
                                    isEqualTo: widget.teacherID)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final data = AddClassesModel.fromJson(
                                          snapshot.data!.docs[index].data());
                                      return SizedBox(
                                        height: screenSize.width * 1 / 13,
                                        width: screenSize.width * 1 / 6,
                                        child: CustomDarkButton(
                                            classID: teacherClassId,
                                            text: data.className,
                                            schoolId: widget.schoolID,
                                            teacherId: widget.teacherID,
                                            onPressed: () {}),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                    itemCount: snapshot.data!.docs.length);
                              } else {
                                return Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                            },
                          ),
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

  void getTeacherDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Teachers")
        .doc(widget.teacherEmail)
        .get();
    setState(() {
      teacherClassId = vari.data()!['classIncharge'];
    });
    log(vari.toString());
  }



  submitSubject(
      BuildContext context, TextEditingController subjecController) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Subject'),
          content: SingleChildScrollView(
            child: TextField(
                controller: subjecController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Name of Subject',

                    // prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide.none,
                    )),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                )),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('add'),
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection("SchoolListCollection")
                    .doc(widget.schoolID)
                    .collection("Classes")
                    .doc(teacherClassId)
                    .collection("Subjects")
                    .doc(subjecController.text.trim().toString())
                    .set({
                  'subject': subjecController.text.trim().toString(),
                  'id': subjecController.text.trim().toString()
                }).then((value) => showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Message'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Successfully created'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        ));
              },
            ),
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

}
