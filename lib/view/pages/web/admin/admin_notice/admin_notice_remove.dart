import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';

class AdminRemoveNoticePage extends StatelessWidget {
  AdminRemoveNoticePage({
    super.key,
    required this.schoolId,
  });
  final String schoolId;

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
                .collection('adminNotice')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final data = AdminNoticeModel.fromJson(
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
                                        await removeAdminNotice(
                                            data.noticeId, schoolId);
                                        if (context.mounted) {
                                          Navigator.of(context).pop();
                                        }
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

  Future<void> removeAdminNotice(String noticeId, String schoolId) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('SchoolListCollection')
        .doc(schoolId)
        .collection('adminNotice')
        .doc(noticeId)
        .delete();
  }
}
