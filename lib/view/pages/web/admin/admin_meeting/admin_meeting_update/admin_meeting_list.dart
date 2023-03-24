import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/admin_models/admin_notice_model/admin_notice_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import 'admin_meeting_show.dart';

class AdminPageMeetingListPage extends StatelessWidget {
  const AdminPageMeetingListPage({
    super.key,
    required this.schoolId,
  });
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Meetings'),
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
                      title: GestureDetector(
                        child: Text(data.subject),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AdminMeetingShowPage(
                                schoolId: schoolId,
                                adminMeetingModel: data,
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
