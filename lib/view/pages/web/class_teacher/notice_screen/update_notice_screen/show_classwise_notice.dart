import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../controllers/Getx/class_teacher/teacher_notice_controller.dart/teacher_notice_controller.dart';
import '../../../../../../model/class_teacher/class_teacher_notice_model.dart';

class ClassTeacherNoticeShow extends StatelessWidget {
  ClassTeacherNoticeShow(
      {super.key,
      required this.schoolId,
      required this.classId,
      required this.classTeacherNoticeModel});
  final String schoolId;
  final String classId;
  final TeacherNoticeController teacherNoticeController =
      Get.put(TeacherNoticeController());
  final ClassTeacherNoticeModel classTeacherNoticeModel;

  @override
  Widget build(BuildContext context) {
    addTextToController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Notice'),
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
                          teacherNoticeController.updateNotice(
                            schoolId: schoolId,
                            classId: classId,
                            classTeacherNoticeModel: ClassTeacherNoticeModel(
                              heading: teacherNoticeController
                                  .headingController.text,
                              topic:
                                  teacherNoticeController.topicController.text,
                              content: teacherNoticeController
                                  .contentController.text,
                              signedBy: teacherNoticeController
                                  .signedByController.text,
                              date: teacherNoticeController.dateController.text,
                              noticeId: classTeacherNoticeModel.noticeId,
                            ),
                            documentId: classTeacherNoticeModel.noticeId,
                            context: context,
                          );
                        },
                        child: const Text(
                          "Update",
                        ),
                      )
                    ],
                  ),
                );
        }));
  }

  void addTextToController() {
    teacherNoticeController.headingController.text =
        classTeacherNoticeModel.heading;
    teacherNoticeController.topicController.text =
        classTeacherNoticeModel.topic;
    teacherNoticeController.contentController.text =
        classTeacherNoticeModel.content;
    teacherNoticeController.signedByController.text =
        classTeacherNoticeModel.signedBy;
    teacherNoticeController.dateController.text = classTeacherNoticeModel.date;
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
