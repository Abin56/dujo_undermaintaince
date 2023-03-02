import 'package:dujo_website/view/pages/web/admin/dujo_admin_teacher_list.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';

class EventsUpdates extends StatefulWidget {
  const EventsUpdates({super.key});

  @override
  State<EventsUpdates> createState() => _EventsUpdatesState();
}

class _EventsUpdatesState extends State<EventsUpdates> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTICES'),
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
