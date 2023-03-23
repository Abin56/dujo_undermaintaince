import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';
import 'notice_screen/create_notice_screen.dart';
import 'notice_screen/remove_class_notice.dart';
import 'notice_screen/update_notice_screen/list_classwise_notice.dart';

class ClassNoticeTeacher extends StatefulWidget {
  const ClassNoticeTeacher({
    super.key,
    required this.classId,
    required this.schoolId,
  });
  final String classId;
  final String schoolId;

  @override
  State<ClassNoticeTeacher> createState() => _ClassNoticeTeacherState();
}

class _ClassNoticeTeacherState extends State<ClassNoticeTeacher> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('CLASS NOTICES'),
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
                          builder: (context) => ClassTeacherCreateNoticePage(
                            classId: widget.classId,
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Create Notice',
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
                          builder: (context) => ClassNoticePage(
                            classId: widget.classId,
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Edit  Notice',
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
                          builder: (context) => RemoveNoticePage(
                            classId: widget.classId,
                            schoolId: widget.schoolId,
                          ),
                        ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Remove  Notice',
                        onTap: () {},
                      )),
                ))),
          ],
        ),
      ),
    );
  }
}
