import 'package:dujo_website/view/pages/web/admin/admin_meeting/admin_meeting_update/admin_meeting_list.dart';

import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';
import 'admin_meeting/admin_create_meeting.dart';
import 'admin_meeting/admin_meeting_update/admin_meeting_remove.dart';

class MeetingUpdates extends StatefulWidget {
  const MeetingUpdates({super.key, required this.schoolId});
  final String schoolId;

  @override
  State<MeetingUpdates> createState() => _MeetingUpdatesState();
}

class _MeetingUpdatesState extends State<MeetingUpdates> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenSize.width * 1 / 3, top: screenSize.width * 1 / 20),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminPageMeetingListPage(
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: ' Meeting Updates',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminCreateNewMeetingPage(
                              schoolId: widget.schoolId),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Create  Meeting',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RemoveAdminMeeting(
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Remove Meeting',
                        onTap: () {},
                      )),
                ))),
          ],
        ),
      ),
    );
  }
}
