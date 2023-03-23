import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../../model/class_teacher/class_teacher_notice_model.dart';
import 'show_classwise_notice.dart';

class ClassNoticePage extends StatelessWidget {
  const ClassNoticePage({
    super.key,
    required this.schoolId,
    required this.classId,
  });
  final String schoolId;
  final String classId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Notice'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(schoolId)
                .collection('Classes')
                .doc(classId)
                .collection('Notice')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    final data = ClassTeacherNoticeModel.fromJson(
                        snapshot.data!.docs[index].data());
                    return ListTile(
                      title: GestureDetector(
                        child: Text(data.heading),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ClassTeacherNoticeShow(
                                classId: classId,
                                schoolId: schoolId,
                                classTeacherNoticeModel: data,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
