import 'package:dujo_website/controllers/Getx/teacher_notice_controller.dart/teacher_notice_controller.dart';
import 'package:dujo_website/model/class_teacher/class_teacher_notice_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassTeacherCreateNoticePage extends StatelessWidget {
  ClassTeacherCreateNoticePage({
    super.key,
    required this.schoolId,
    required this.classId,
  });
  final String schoolId;
  final String classId;
  final TeacherNoticeController teacherNoticeController =
      Get.put(TeacherNoticeController());

  @override
  Widget build(BuildContext context) {
    teacherNoticeController.clearControllers();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Events'),
        ),
        body: Obx(() {
          return teacherNoticeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  child: ListView(
                    children: <Widget>[
                      TextFormFieldWidget(
                          hint: 'Heading',
                          controller:
                              teacherNoticeController.headingController),
                      TextFormFieldWidget(
                          hint: 'Topic',
                          controller: teacherNoticeController.topicController),
                      TextFormFieldWidget(
                          hint: 'Content',
                          controller:
                              teacherNoticeController.contentController),
                      TextFormFieldWidget(
                          hint: 'Signed By',
                          controller:
                              teacherNoticeController.signedByController),
                      TextFormFieldWidget(
                          hint: 'Date',
                          controller: teacherNoticeController.dateController),
                      ElevatedButton(
                          onPressed: () async {
                            await teacherNoticeController.createNotice(
                                schoolId: schoolId,
                                classId: classId,
                                classTeacherNoticeModel:
                                    ClassTeacherNoticeModel(
                                  heading: teacherNoticeController
                                      .headingController.text,
                                  topic: teacherNoticeController
                                      .topicController.text,
                                  content: teacherNoticeController
                                      .contentController.text,
                                  signedBy: teacherNoticeController
                                      .signedByController.text,
                                  date: teacherNoticeController
                                      .dateController.text,
                                  noticeId: '',
                                ));
                          },
                          child: const Text("Submit"))
                    ],
                  ),
                );
        }));
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
