import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../model/class_teacher/class_teacher_event_model.dart';
import '../../../../../controllers/Getx/class_teacher/teacher_event_controller/teacher_event_controller.dart';

class RemoveEventsPage extends StatelessWidget {
  RemoveEventsPage({
    super.key,
    required this.schoolId,
    required this.classId,
  });
  final String schoolId;
  final String classId;
  final TeacherEventController teacherEventController =
      Get.put(TeacherEventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Events'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(schoolId)
                .collection('Classes')
                .doc(classId)
                .collection('Events')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final data = ClassTeacherEventModel.fromJson(
                          snapshot.data!.docs[index].data());
                      return ListTile(
                        title: Text(data.eventName),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Remove'),
                                  content: const Text(
                                      'Are you sure you want to remove this Event'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        teacherEventController.deleteEvent(
                                          schoolId: schoolId,
                                          classId: classId,
                                          documentId: data.eventId,
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
