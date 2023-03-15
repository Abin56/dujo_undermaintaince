import 'package:dujo_website/model/teacher/add_teacher.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/get_classes.dart';
import 'package:flutter/material.dart';

import '../../Login/Admin/teacher_section/selectClass_.dart';
import '../widgets/custom_blue_button.dart';

class AddTeacher extends StatefulWidget {
  var id;
  AddTeacher({this.id, super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  TextEditingController teacherName = TextEditingController();
  TextEditingController classIncharge = TextEditingController();
  TextEditingController employeeID = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('ADD TEACHER')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 9),
          child: Center(
            child: Container(
              color: Colors.white,
              height: screenSize.width * 1 / 2,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: teacherName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Teacher Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Teacher PhNo',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Teacher email',
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child:
                        GetClassTeacherListDropDownButton(schooID: widget.id)),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: employeeID,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Employee ID',
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 1 / 25,
                  width: screenSize.width * 1 / 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      print('adf');
                      final teacherDetails = AddTeachersModel(
                          teacherEmail: emailController.text.trim(),
                          teacherPhNo: phoneNumberController.text.trim(),
                          id: emailController.text.trim(),
                          teacherName: teacherName.text.trim(),
                          classIncharge: classIDListValue!["classID"]??'',
                          employeeID: employeeID.text.trim(),
                          joinDate: DateTime.now().toString());
                      CreateTeachersAddToFireBase().createSchoolController(
                          teacherDetails, context, widget.id);
                    },
                    child: const Text("Add Teacher"),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
