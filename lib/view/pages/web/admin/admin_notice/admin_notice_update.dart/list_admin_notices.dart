import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/admin_models/admin_notice_model/admin_notice_model.dart';
import 'package:flutter/material.dart';
import 'show_admin_notice.dart';

class AdminPageNoticeListPage extends StatelessWidget {
  const AdminPageNoticeListPage({
    super.key,
    required this.schoolId,
  });
  final String schoolId;

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
                      title: GestureDetector(
                        child: Text(data.heading),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AdminNoticeShow(
                                schoolId: schoolId,
                                adminNoticeModel: data,
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
