import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateTeacherDetails extends StatelessWidget {
  var id;
  var teacherdataid;
  String teacherName;
  String teacherID;
  String classIncharge;
  UpdateTeacherDetails(
      {required this.teacherName,
      required this.classIncharge,
      required this.teacherID,
      required this.teacherdataid,
      this.id,
      super.key});

  TextEditingController newteacherNameController = TextEditingController();

  TextEditingController newclassInchargeController = TextEditingController();

  TextEditingController newemployeeIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('Update Teacher details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 9),
          child: Center(
            child: Container(
              color: Colors.white,
              height: screenSize.width * 1 / 4,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: newteacherNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Name : $teacherName',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: newclassInchargeController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Class Incharge : $classIncharge',
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Center(
                        child: Text('ID : $teacherID'),
                      ),
                    )),
                SizedBox(
                  height: screenSize.width * 1 / 25,
                  width: screenSize.width * 1 / 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      log("working");
                      final newTeacherName =
                          newteacherNameController.text.trim();
                      final newClassIncharge =
                          newclassInchargeController.text.trim();

                      try {
                        final data = FirebaseFirestore.instance
                            .collection("SchoolListCollection")
                            .doc(id)
                            .collection("Teachers")
                            .doc(teacherdataid);
                        if (newTeacherName.isNotEmpty &&
                            newClassIncharge.isEmpty) {
                          await data.update(
                              {"teacherName": newTeacherName}).then((value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
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
                        } else if (newTeacherName.isEmpty &&
                            newClassIncharge.isNotEmpty) {
                          await data
                              .update({"classIncharge": newClassIncharge}).then(
                                  (value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
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
                        } else if (newTeacherName.isNotEmpty &&
                            newClassIncharge.isNotEmpty) {
                          await data.update({
                            "teacherName": newTeacherName,
                            "classIncharge": newClassIncharge,
                          }).then((value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
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
                        } else if (newTeacherName.isNotEmpty &&
                            newClassIncharge.isEmpty) {
                          await data.update({
                            "teacherName": newTeacherName,
                          }).then((value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
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
                        } else if (newTeacherName.isEmpty &&
                            newClassIncharge.isNotEmpty) {
                          await data.update({
                            "classIncharge": newClassIncharge,
                          }).then((value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
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
                        } else if (newTeacherName.isNotEmpty &&
                            newClassIncharge.isNotEmpty) {
                          await data.update({
                            "teacherName": newTeacherName,
                            "classIncharge": newClassIncharge
                          }).then((value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
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
                        }
                      } on FirebaseException catch (e) {
                        log(e.message.toString());
                      }
                    },
                    child: const Text("Update details"),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
