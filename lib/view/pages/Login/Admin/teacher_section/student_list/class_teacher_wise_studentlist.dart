import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/student_list/student_list_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../model/student/student_list_model.dart';
import 'dart:math' as math;

class ClassTeacherWiseStudentList extends StatelessWidget {
  final String schoolId;
  final String teacherId;
  final String classID;
  const ClassTeacherWiseStudentList({
    super.key,
    required this.schoolId,
    required this.teacherId,
    required this.classID,
  });

  // QuerySnapshot<Map<String, dynamic>>? teacherClassData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Students Lists',
        ),
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(schoolId)
            .collection("Classes")
            .doc(classID)
            .collection("Students")
            .where('deactivate', isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final listData =
                      StudentData.fromJson(snapshot.data!.docs[index].data());
                  return GestureDetector(
                    onTap: () => getStudentData(
                      schoolId: schoolId,
                      context: context,
                      studentData: listData,
                      classId: classID,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      color: Color(
                        (math.Random().nextDouble() * 0xFFFFFF).toInt(),
                      ).withOpacity(1.0),
                      child: Center(
                        child: Text(
                          listData.studentName,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
