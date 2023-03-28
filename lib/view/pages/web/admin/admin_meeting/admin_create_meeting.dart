import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/Getx/admin/meeting_controller.dart';
import '../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';

class AdminCreateNewMeetingPage extends StatefulWidget {
  const AdminCreateNewMeetingPage({
    super.key,
    required this.schoolId,
  });
  final String schoolId;

  @override
  State<AdminCreateNewMeetingPage> createState() => _MeetingCreatesState();
}

class _MeetingCreatesState extends State<AdminCreateNewMeetingPage> {
  AdminMeetingController adminMeetingController =
      Get.put(AdminMeetingController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 206, 178),
      appBar: AppBar(title: const Text('Meeting Creation')),
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
                    height: screenSize.width * 1 / 2.1,
                    width: screenSize.width * 1 / 3,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: adminMeetingController.dateController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Date',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: adminMeetingController.headingController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Heading',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: adminMeetingController
                              .categoryOfMeetingController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Category of meeting',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: adminMeetingController
                              .membersTobeExpectedController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Members to be Expected',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller:
                              adminMeetingController.specialGuestController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Special Guest',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: adminMeetingController.timeController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Time',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: adminMeetingController.venueController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Venue',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          //  Navigator.push
                          //                 (context, MaterialPageRoute
                          //                 (builder:
                          //                 ((context) =>  )));
                        },
                        child: Container(
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
                              adminMeetingController.addAdminMeeting(
                                  widget.schoolId,
                                  AdminMeetingModel(
                                    date: adminMeetingController
                                        .dateController.text,
                                    heading: adminMeetingController
                                        .headingController.text,
                                    categoryOfMeeting: adminMeetingController
                                        .categoryOfMeetingController.text,
                                    membersToBeExpected: adminMeetingController
                                        .membersTobeExpectedController.text,
                                    specialGuest: adminMeetingController
                                        .specialGuestController.text,
                                    time: adminMeetingController
                                        .timeController.text,
                                    venue: adminMeetingController
                                        .venueController.text,
                                    meetingId: '',
                                  ));
                            },
                            child: const Text('Create'),
                          ),
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
