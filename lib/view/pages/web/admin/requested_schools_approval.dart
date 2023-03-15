import 'package:dujo_website/view/pages/web/admin/requested_schools_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestedSchoolsApproval extends StatelessWidget {
  RequestedSchoolsApproval({super.key});

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Requests Pending for approval'),
      ),
      body: StreamBuilder(
          stream: _firestore.collection('RequestedSchools').snapshots(),
          builder: ((context, snapshot) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
                snapshot.data!.docs;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              if (documents.length > 0) {
                return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        RequestedSchoolsMainScreen())));
                          },
                          leading: Container(
                              width: 50,
                              child: Text('${documents[index]['schoolID']}')),
                          title: Text(documents[index]['schoolName']),
                          subtitle: Text(
                              '${documents[index]['district']},${documents[index]['place']}, Phone:${documents[index]['phoneNumber']}'),
                          trailing: TextButton(
                              onPressed: () {},
                              child: TextButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('SchoolListCollection')
                                        .doc('${documents[index]['schoolID']}')
                                        .set(documents[index].data());
                                  },
                                  child: Text('Approve'))));
                    });
              }
            } else {
              return CircularProgressIndicator.adaptive();
            }
            return Center(
              child: Text('Something went wrong'),
            );
          })),
    );
  }
}
