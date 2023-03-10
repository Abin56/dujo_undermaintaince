import 'package:dujo_website/model/teacher/add_teacher.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/get_classes.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/selectClass_.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/teacher/add_guardian.dart';


class AddStudentGuardian extends StatefulWidget {
  var id;
  AddStudentGuardian({this.id, super.key});

  @override
  State<AddStudentGuardian> createState() => _AddStudentGuardianState();
}

class _AddStudentGuardianState extends State<AddStudentGuardian> {
  TextEditingController teacherName = TextEditingController();
  TextEditingController classIncharge = TextEditingController();
  TextEditingController employeeID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('ADD GUARDIAN')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 9),
          child: Center(
            child: Container(
              color: Colors.white,
              height: screenSize.width * 1 / 4,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: teacherName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Guardian Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GetClassTeacherListDropDownButton(schooID: widget.id)
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: employeeID,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Student AdmissionNumber',
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
                      final guardianDetails = AddGuardianModel(
                          id: employeeID.text.trim(),
                          teacherName: teacherName.text.trim(),
                          classIncharge: classIDListValue!["classID"],
                          employeeID: employeeID.text.trim(),
                          joinDate: DateTime.now().toString());
                      CreateGuardianAddToFireBase().createGuardianController(
                          guardianDetails, context, widget.id);
                    },
                    child: const Text("Add Guardian"),
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
