import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../controllers/Getx/admin/meeting_controller.dart';
import '../../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';

class AdminMeetingShowPage extends StatelessWidget {
  AdminMeetingShowPage(
      {super.key, required this.schoolId, required this.adminMeetingModel});
  final String schoolId;

  final AdminMeetingModel adminMeetingModel;
  AdminMeetingController adminMeetingController =
      Get.put(AdminMeetingController());

  @override
  Widget build(BuildContext context) {
    addTextToController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Meetings'),
        ),
        body: Obx(() {
          return adminMeetingController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  child: ListView(
                    children: <Widget>[
                      TextFormFieldWidget(
                          hint: 'Date',
                          controller: adminMeetingController.dateController),
                      TextFormFieldWidget(
                          hint: 'Time',
                          controller: adminMeetingController.timeController),
                      TextFormFieldWidget(
                          hint: 'Subject',
                          controller: adminMeetingController.subjectController),
                      TextFormFieldWidget(
                          hint: 'Conducted By',
                          controller:
                              adminMeetingController.conductedByController),
                      TextFormFieldWidget(
                          hint: 'Chief Guest',
                          controller:
                              adminMeetingController.chiefGuestController),
                      ElevatedButton(
                        onPressed: () async {
                          adminMeetingController.updateMeetingData(
                              schoolId: schoolId,
                              adminMeetingModel: AdminMeetingModel(
                                date:
                                    adminMeetingController.dateController.text,
                                time:
                                    adminMeetingController.timeController.text,
                                subject: adminMeetingController
                                    .subjectController.text,
                                conductedBy: adminMeetingController
                                    .conductedByController.text,
                                chiefGuest: adminMeetingController
                                    .chiefGuestController.text,
                                meetingId: adminMeetingModel.meetingId,
                              ),
                              documentId: adminMeetingModel.meetingId,
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
    adminMeetingController.dateController.text = adminMeetingModel.date;
    adminMeetingController.timeController.text = adminMeetingModel.time;
    adminMeetingController.subjectController.text = adminMeetingModel.subject;
    adminMeetingController.conductedByController.text =
        adminMeetingModel.conductedBy;
    adminMeetingController.chiefGuestController.text =
        adminMeetingModel.chiefGuest;
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
