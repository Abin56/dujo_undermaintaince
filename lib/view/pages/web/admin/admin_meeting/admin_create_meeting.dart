import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/Getx/admin/meeting_controller.dart';
import '../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';

class AdminCreateNewMeetingPage extends StatelessWidget {
  AdminCreateNewMeetingPage({super.key, required this.schoolId});
  final String schoolId;

  AdminMeetingController adminMeetingController =
      Get.put(AdminMeetingController());

  @override
  Widget build(BuildContext context) {
    adminMeetingController.clearControllers();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('Add New Meetings')),
      body: adminMeetingController.isLoading.value
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
                          controller: adminMeetingController.dateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: adminMeetingController.timeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Time',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: adminMeetingController.subjectController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Subject',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller:
                              adminMeetingController.conductedByController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Condected By',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller:
                              adminMeetingController.chiefGuestController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Chief Guest',
                          ),
                        ),
                      ),
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
                          onPressed: () async {
                            await adminMeetingController.addAdminMeeting(
                                schoolId,
                                AdminMeetingModel(
                                  date: adminMeetingController
                                      .dateController.text,
                                  time: adminMeetingController
                                      .timeController.text,
                                  subject: adminMeetingController
                                      .subjectController.text,
                                  conductedBy: adminMeetingController
                                      .conductedByController.text,
                                  chiefGuest: adminMeetingController
                                      .chiefGuestController.text,
                                  meetingId: '',
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
}
