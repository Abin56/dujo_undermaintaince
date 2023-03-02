import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/teacher/add_teacher.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/update_tec_details.dart';
import 'package:dujo_website/view/pages/web/admin/add_teacher.dart';
import 'package:dujo_website/view/pages/web/admin/meeting_updates.dart';
import 'package:dujo_website/view/pages/web/admin/notices_updates.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdminTeachersPanelScreen extends StatelessWidget {
  var id;

  AdminTeachersPanelScreen({this.id, super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AddTeacher(id: id),
                        ),
                      );
                    },
                    child: Container(
                        width: screenSize.width * 1 / 3.3,
                        height: screenSize.width * 1 / 2.09,
                        // height: screenSize.width * 1 / 4,
                        //color: Colors.blue,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 14, 80, 73),
                                Color(0xFF26A69A)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        padding: const EdgeInsets.only(
                          top: 50,
                        ),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("SchoolListCollection")
                                .doc(id)
                                .collection("Teachers")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final data = AddTeachersModel.fromJson(
                                          snapshot.data!.docs[index].data());
                                      return InkWell(
                                        onTap: () async {
                                          await showTeacherDetails(
                                              context: context,
                                              schoolId: id,
                                              mainID: id,
                                              teacherid: data.employeeID,
                                              teacherName: data.teacherName,
                                              joinDaTE: data.joinDate,
                                              classIncarge: data.classIncharge);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 400,
                                          color:
                                              Color.fromARGB(255, 1, 238, 255),
                                          child: Center(
                                              child: Text(data.teacherName)),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemCount: snapshot.data!.docs.length);
                              } else {
                                return Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                            })),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AddTeacher(id: id),
                            ),
                          );
                        },
                        child: Container(
                          height: screenSize.width * 1 / 10,
                          width: screenSize.width * 1 / 3,
                          child: CustomContainer(
                            text: 'Add Teacher',
                            onTap: () {},
                          ),
                          // color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const NoticeUpdates(),
                        ),
                      );
                    },
                    child: Container(
                      width: screenSize.width * 1 / 4,
                      height: screenSize.width * 1 / 2.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF26A69A),
                              Color.fromARGB(255, 9, 49, 45),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: screenSize.width * 1 / 16,
                            top: screenSize.width * 1 / 15),
                        child: Text(
                          "Class Status",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  // color: Colors.red,
                )
              ],
            )

            //CustomButton(text: "jfjhfj", onPressed: () {})
          ],
        ),
      ),
    );
  }
}

showTeacherDetails(
    {required context,
    required schoolId,
    required mainID,
    required teacherid,
    required teacherName,
    required joinDaTE,
    required classIncarge}) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Teacher Details'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Row(
                children: [
                  Text('Name :'),
                  Text(teacherName),
                ],
              ),
              Row(
                children: [
                  Text('ID :'),
                  Text(teacherid),
                ],
              ),
              Row(
                children: [
                  Text('ClassIncharge :'),
                  Text(classIncarge),
                ],
              ),
              Row(
                children: [
                  Text('Date :'),
                  Text(joinDaTE),
                ],
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Row(
              children: const [
                Icon(Icons.edit),
                Text('edit'),
              ],
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UpdateTeacherDetails(
                      id: mainID,
                      teacherName: teacherName,
                      classIncharge: classIncarge,
                      teacherID: teacherid,
                      teacherdataid: teacherid);
                },
              ));
            },
          ),
          TextButton(
            child: Row(
              children: const [
                Icon(Icons.delete),
                Text('remove'),
              ],
            ),
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection("SchoolListCollection")
                  .doc(schoolId)
                  .collection("Teachers")
                  .doc(teacherid)
                  .delete()
                  .then((value) {
                return showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Message'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text('Successfully Updated'),
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
                );
              });
            },
          ),
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
