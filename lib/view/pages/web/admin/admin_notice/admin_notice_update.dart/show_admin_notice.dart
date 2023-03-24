import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';

class AdminNoticeShow extends StatefulWidget {
  AdminNoticeShow(
      {super.key, required this.schoolId, required this.adminNoticeModel});
  final String schoolId;

  final AdminNoticeModel adminNoticeModel;

  @override
  State<AdminNoticeShow> createState() => _AdminNoticeShowState();
}

class _AdminNoticeShowState extends State<AdminNoticeShow> {
  TextEditingController dateController = TextEditingController();

  TextEditingController headingController = TextEditingController();

  TextEditingController subjectController = TextEditingController();

  TextEditingController topicsController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  TextEditingController signedByController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    addValueToTextField();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update new Notice'),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                child: ListView(
                  children: <Widget>[
                    TextFormFieldWidget(
                      hint: 'Date',
                      controller: dateController,
                    ),
                    TextFormFieldWidget(
                        hint: 'Heading', controller: headingController),
                    TextFormFieldWidget(
                        hint: 'Subject', controller: subjectController),
                    TextFormFieldWidget(
                        hint: 'Topic', controller: topicsController),
                    TextFormFieldWidget(
                      hint: 'Content',
                      controller: contentController,
                    ),
                    TextFormFieldWidget(
                      hint: 'Signed By',
                      controller: signedByController,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        await updateAdminNotice(
                            AdminNoticeModel(
                              date: dateController.text,
                              heading: headingController.text,
                              subject: subjectController.text,
                              topics: topicsController.text,
                              content: contentController.text,
                              signedBy: signedByController.text,
                              noticeId: widget.adminNoticeModel.noticeId,
                            ),
                            widget.schoolId);
                        clearContollers();
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: const Text(
                        "Update",
                      ),
                    )
                  ],
                ),
              ));
  }

  void clearContollers() {
    dateController.clear();
    headingController.clear();
    subjectController.clear();
    topicsController.clear();
    contentController.clear();
    signedByController.clear();
  }

  void addValueToTextField() {
    dateController.text = widget.adminNoticeModel.date;
    headingController.text = widget.adminNoticeModel.heading;
    subjectController.text = widget.adminNoticeModel.subject;
    topicsController.text = widget.adminNoticeModel.topics;
    contentController.text = widget.adminNoticeModel.content;
    signedByController.text = widget.adminNoticeModel.signedBy;
  }

  Future<void> updateAdminNotice(
      AdminNoticeModel adminNoticeModel, String schoolId) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('adminNotice')
          .doc(adminNoticeModel.noticeId)
          .update(adminNoticeModel.toJson());
    } catch (e) {
      log(e.toString());
    }
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key, this.hint = '', required this.controller});
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hint),
      controller: controller,
    );
  }
}
