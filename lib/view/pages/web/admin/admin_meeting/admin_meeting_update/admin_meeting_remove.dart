import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/controllers/Getx/admin/meeting_controller.dart';
import 'package:dujo_website/model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoveAdminMeeting extends StatelessWidget {
  RemoveAdminMeeting({
    super.key,
    required this.schoolId,
  });
  final String schoolId;
  final AdminMeetingController adminMeetingController =
      Get.put(AdminMeetingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Remove meetings'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(schoolId)
                .collection('AdminMeeting')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final data = AdminMeetingModel.fromJson(
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
                                        await adminMeetingController
                                            .deleteMeeting(
                                          schoolId: schoolId,
                                          documentId: data.meetingId,
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
