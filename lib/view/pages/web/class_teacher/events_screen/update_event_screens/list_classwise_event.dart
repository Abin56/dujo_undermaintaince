import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/view/pages/web/class_teacher/events_screen/update_event_screens/show_classwise_events.dart';
import 'package:flutter/material.dart';
import '../../../../../../model/class_teacher/class_teacher_event_model.dart';

class ClassEventsPage extends StatelessWidget {
  const ClassEventsPage({
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
                      title: GestureDetector(
                        child: Text(data.eventName),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ClassTeacherEventShow(
                                classId: classId,
                                schoolId: schoolId,
                                classTeacherEventModel: data,
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
