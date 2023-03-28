import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../controllers/Getx/admin/meeting_controller.dart';
import '../../../../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';

// class AdminMeetingShowPage extends StatelessWidget {
//   AdminMeetingShowPage(
//       {super.key, required this.schoolId, required this.adminMeetingModel});
//   final String schoolId;

//   final AdminMeetingModel adminMeetingModel;
//   AdminMeetingController adminMeetingController =
//       Get.put(AdminMeetingController());

//   @override
//   Widget build(BuildContext context) {
//     addTextToController();
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Update Meetings'),
//         ),
//         body: Obx(() {
//           return adminMeetingController.isLoading.value
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Form(
//                   child: ListView(
//                     children: <Widget>[
//                       TextFormFieldWidget(
//                           hint: 'Date',
//                           controller: adminMeetingController.dateController),
//                       TextFormFieldWidget(
//                           hint: 'Time',
//                           controller: adminMeetingController.timeController),
//                       TextFormFieldWidget(
//                           hint: 'Subject',
//                           controller: adminMeetingController.subjectController),
//                       TextFormFieldWidget(
//                           hint: 'Conducted By',
//                           controller:
//                               adminMeetingController.conductedByController),
//                       TextFormFieldWidget(
//                           hint: 'Chief Guest',
//                           controller:
//                               adminMeetingController.chiefGuestController),
//                       ElevatedButton(
//                         onPressed: () async {
//                           // adminMeetingController.updateMeetingData(
//                           //     schoolId: schoolId,
//                           //     adminMeetingModel: AdminMeetingModel(
//                           //       date:
//                           //           adminMeetingController.dateController.text,
//                           //       time:
//                           //           adminMeetingController.timeController.text,
//                           //       subject: adminMeetingController
//                           //           .subjectController.text,
//                           //       conductedBy: adminMeetingController
//                           //           .conductedByController.text,
//                           //       chiefGuest: adminMeetingController
//                           //           .chiefGuestController.text,
//                           //       meetingId: adminMeetingModel.meetingId,
//                           //     ),
//                           //     documentId: adminMeetingModel.meetingId,
//                           //     context: context);
//                         },
//                         child: const Text(
//                           "Update",
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//         }));
//   }

//   void addTextToController() {
//     // adminMeetingController.dateController.text = adminMeetingModel.date;
//     // adminMeetingController.timeController.text = adminMeetingModel.time;
//     // adminMeetingController.subjectController.text = adminMeetingModel.subject;
//     // adminMeetingController.conductedByController.text =
//     //     adminMeetingModel.conductedBy;
//     // adminMeetingController.chiefGuestController.text =
//     //     adminMeetingModel.chiefGuest;
//   }
// }

// class TextFormFieldWidget extends StatelessWidget {
//   const TextFormFieldWidget(
//       {super.key, this.hint = '', required this.controller});
//   final String hint;
//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(hintText: hint),
//       controller: controller,
//     );
//   }
// }

class AdminMeetingShowPage extends StatefulWidget {
  const AdminMeetingShowPage(
      {super.key, required this.schoolId, required this.adminMeetingModel});
  final String schoolId;
  final AdminMeetingModel adminMeetingModel;

  @override
  State<AdminMeetingShowPage> createState() => _MeetingCreatesState();
}

class _MeetingCreatesState extends State<AdminMeetingShowPage> {
  AdminMeetingController adminMeetingController =
      Get.put(AdminMeetingController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    addTextToController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 206, 178),
      appBar: AppBar(title: const Text('Meeting Update')),
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
                              adminMeetingController.updateMeetingData(
                                  schoolId: widget.schoolId,
                                  adminMeetingModel: AdminMeetingModel(
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
                                    meetingId:
                                        widget.adminMeetingModel.meetingId,
                                  ),
                                  documentId:
                                      widget.adminMeetingModel.meetingId,
                                  context: context);
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

  void addTextToController() {
    adminMeetingController.dateController.text = widget.adminMeetingModel.date;
    adminMeetingController.categoryOfMeetingController.text =
        widget.adminMeetingModel.categoryOfMeeting;
    adminMeetingController.headingController.text =
        widget.adminMeetingModel.heading;
    adminMeetingController.membersTobeExpectedController.text =
        widget.adminMeetingModel.membersToBeExpected;
    adminMeetingController.timeController.text = widget.adminMeetingModel.time;
    adminMeetingController.venueController.text =
        widget.adminMeetingModel.venue;
    adminMeetingController.specialGuestController.text =
        widget.adminMeetingModel.specialGuest;
  }
}
