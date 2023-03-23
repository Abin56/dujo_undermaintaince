import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/controllers/Getx/teacher_notice_controller.dart/teacher_notice_controller.dart';
import 'package:dujo_website/model/class_teacher/class_teacher_notice_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoveNoticePage extends StatelessWidget {
  RemoveNoticePage({
    super.key,
    required this.schoolId,
    required this.classId,
  });
  final String schoolId;
  final String classId;
  final TeacherNoticeController teacherEventController =
      Get.put(TeacherNoticeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notices'),
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
                        title: Text(data.heading),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Remove'),
                                  content: const Text(
                                      'Are you sure you want to remove this Notice'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        teacherEventController.deleteNotice(
                                          schoolId: schoolId,
                                          classId: classId,
                                          documentId: data.noticeId,
                                          context: context,
                                        );
                                      },
                                      child: const Text('Remove'),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
