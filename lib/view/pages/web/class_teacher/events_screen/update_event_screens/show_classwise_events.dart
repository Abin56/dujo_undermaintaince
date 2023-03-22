import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../controllers/Getx/teacher_event_controller/teacher_event_controller.dart';
import '../../../../../../model/class_teacher/class_teacher_event_model.dart';

class ClassTeacherEventShow extends StatelessWidget {
  ClassTeacherEventShow(
      {super.key,
      required this.schoolId,
      required this.classId,
      required this.classTeacherEventModel});
  final String schoolId;
  final String classId;
  final TeacherEventController teacherEventController =
      Get.put(TeacherEventController());
  final ClassTeacherEventModel classTeacherEventModel;

  @override
  Widget build(BuildContext context) {
    addTextToController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Events'),
        ),
        body: Obx(() {
          return teacherEventController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  child: ListView(
                    children: <Widget>[
                      TextFormFieldWidget(
                          hint: 'Event Name',
                          controller: teacherEventController.nameController),
                      TextFormFieldWidget(
                          hint: 'Event date',
                          controller: teacherEventController.dateController),
                      TextFormFieldWidget(
                          hint: 'Event Description',
                          controller:
                              teacherEventController.descriptionController),
                      TextFormFieldWidget(
                          hint: 'Venue',
                          controller: teacherEventController.venueController),
                      TextFormFieldWidget(
                          hint: 'Chief Guest',
                          controller:
                              teacherEventController.chiefGuestController),
                      TextFormFieldWidget(
                          hint: 'Participants',
                          controller:
                              teacherEventController.participantsController),
                      ElevatedButton(
                        onPressed: () async {
                          teacherEventController.updateEvent(
                              schoolId: schoolId,
                              classId: classId,
                              classTeacherEventModel: ClassTeacherEventModel(
                                eventId: classTeacherEventModel.eventId,
                                eventName:
                                    teacherEventController.nameController.text,
                                eventDate:
                                    teacherEventController.dateController.text,
                                description: teacherEventController
                                    .descriptionController.text,
                                venue:
                                    teacherEventController.venueController.text,
                                chiefGuest: teacherEventController
                                    .chiefGuestController.text,
                                participants: teacherEventController
                                    .participantsController.text,
                                image: '',
                              ),
                              documentId: classTeacherEventModel.eventId,
                              context: context);
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
    teacherEventController.nameController.text =
        classTeacherEventModel.eventName;
    teacherEventController.dateController.text =
        classTeacherEventModel.eventDate;
    teacherEventController.descriptionController.text =
        classTeacherEventModel.description;
    teacherEventController.venueController.text = classTeacherEventModel.venue;
    teacherEventController.chiefGuestController.text =
        classTeacherEventModel.chiefGuest;
    teacherEventController.participantsController.text =
        classTeacherEventModel.participants;
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
