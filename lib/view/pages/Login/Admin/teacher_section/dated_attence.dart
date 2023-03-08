import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/create_classModel/attendence_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class DatedAttendenceListViewScreen extends StatelessWidget {
  var schoolId;
  var classID;
  var date;
  
  DatedAttendenceListViewScreen(
      {required this.schoolId,
      required this.classID,
      required this.date,
      super.key});

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
            .doc(date)
            .collection("PresentList")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final data = GetAttendenceModel.fromJson(
                      snapshot.data!.docs[index].data());
                  return Container(
                    color: data.present==true?Colors.green:Colors.red,
                    height: 60,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        data.studentName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
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
      ),
      ),
    );
  }
}
