import 'package:dujo_website/view/pages/web/admin/dujo_admin_teacher_list.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';

class ClassEventsTeacher extends StatefulWidget {
  const ClassEventsTeacher({super.key});

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
                          builder: (context) => AdminTeacherList(),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Create Events',
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
                          builder: (context) => AdminTeacherList(),
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
                          builder: (context) => AdminTeacherList(),
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
