import 'package:flutter/material.dart';

import '../../Login/Admin/teacher_section/student_list/class_teacher_wise_studentlist.dart';

class CustomDarkButton extends StatelessWidget {
  final String text;
  var classID;
  var schoolId;
  var teacherId;
  final VoidCallback onPressed;
  final schoolId;
  final teacherId;
  var classID;

   CustomDarkButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.schoolId,
    this.teacherId,
     this.classID,
  }) : super(key: key);
=======
   CustomDarkButton(
      {Key? key, required this.text, required this.onPressed,this.classID,this.schoolId,this.teacherId})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(0, 54, 6, 6),
              // Color.fromARGB(255, 20, 178, 218),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ClassTeacherWiseStudentList(
                  classID: classID,
                  schoolId: schoolId,
                  teacherId: teacherId,
                );
              }));
            },
            child: Center(child: Text(text)),
          ),
        ));
  }
}
