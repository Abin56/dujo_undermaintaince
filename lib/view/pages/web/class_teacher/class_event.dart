import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';
import 'events_screen/create_events_screen.dart';
import 'events_screen/remove_class_events.dart';
import 'events_screen/update_event_screens/list_classwise_event.dart';

class ClassEventsTeacher extends StatefulWidget {
  const ClassEventsTeacher({
    super.key,
    required this.classId,
    required this.schoolId,
  });
  final String schoolId;
  final String classId;

  @override
  State<ClassEventsTeacher> createState() => _ClassEventsTeacherState();
}

class _ClassEventsTeacherState extends State<ClassEventsTeacher> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('CLASS EVENTS'),
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
                          builder: (context) => ClassTeacherCreateEventsPage(
                            classId: widget.classId,
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Create Events',
                        onTap: () async {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClassEventsPage(
                            classId: widget.classId,
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      //color: Colors.red,
                      child: CustomContainer(
                        text: 'Edit Events',
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
                          builder: (context) => RemoveEventsPage(
                            classId: widget.classId,
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Remove Events',
                        onTap: () {},
                      )),
                ))),
          ],
        ),
      ),
    );
  }
}
