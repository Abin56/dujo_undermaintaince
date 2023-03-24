import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';

class AddNewNotices extends StatefulWidget {
  const AddNewNotices({super.key, required this.schoolId});
  final String schoolId;

  @override
  State<AddNewNotices> createState() => _AddNewNoticesState();
}

class _AddNewNoticesState extends State<AddNewNotices> {
  TextEditingController dateController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController topicsController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController signedByController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('Add New Notice')),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: screenSize.width * 1 / 13, bottom: 50),
                child: Center(
                  child: Container(
                    color: Colors.white,
                    height: screenSize.height * 1 / 1,
                    width: screenSize.width * 1 / 3,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date',
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: headingController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Heading',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: subjectController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Subject',
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: topicsController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Topics',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: contentController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Content',
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: signedByController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Signed by',
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 40,
                          width: screenSize.width * 1 / 8,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(14)),
                          child: const Center(child: Text('Upload Notices')),
                        ),
                      ),

                      // const SizedBox(
                      //   height: 30,
                      // ),
                      Container(
                        height: screenSize.width * 1 / 30,
                        width: screenSize.width * 1 / 5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(14)),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(9.0),
                            textStyle: const TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            addAdminNotice(
                                widget.schoolId,
                                AdminNoticeModel(
                                  date: dateController.text,
                                  heading: headingController.text,
                                  subject: subjectController.text,
                                  topics: topicsController.text,
                                  content: contentController.text,
                                  signedBy: signedByController.text,
                                  noticeId: '',
                                ));
                          },
                          child: const Text('Create'),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
    );
  }

  //add admin notice to firebase

  void addAdminNotice(String schoolId, AdminNoticeModel adminNotice) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      setState(() {
        isLoading = true;
      });

      final data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('adminNotice')
          .add(
            adminNotice.toJson(),
          );
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('adminNotice')
          .doc(data.id)
          .update({"noticeId": data.id});
      clearContollers();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  //update admin notice to firebase





  void clearContollers() {
    dateController.clear();
    headingController.clear();
    subjectController.clear();
    topicsController.clear();
    contentController.clear();
    signedByController.clear();
  }
}
