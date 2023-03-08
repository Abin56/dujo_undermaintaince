import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/dated_attence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../../../../../model/create_classModel/attendence_model.dart';

class AttendenceDetailsScreen extends StatelessWidget {
  var schoolId;
  var classID;
  AttendenceDetailsScreen(
      {required this.schoolId, required this.classID, super.key});

  @override
  Widget build(BuildContext context) {
    log(classID);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendence Book'),
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(schoolId)
            .collection("Classes")
            .doc(classID)
            .collection("Attendence")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  log("document>>>>>>>${snapshot.data!.docs[index].toString()}");
                  final data = GetAttendenceModel.fromJson(
                      snapshot.data!.docs[index].data());
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DatedAttendenceListViewScreen(
                              schoolId: schoolId,
                              classID: classID,
                              date: data.id);
                        },
                      ));
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          data.id,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
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
      )),
    );
  }
}
