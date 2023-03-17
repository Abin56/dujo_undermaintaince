import 'package:dujo_website/model/create_classModel/addStudent_model.dart';
import 'package:dujo_website/view/pages/Login/Admin/teacher_section/get_classes.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_blue_button.dart';

class AddStudentTea extends StatelessWidget {
  var schoolID;
  var teacherID;

  TextEditingController studentNameController = TextEditingController();
  TextEditingController parentPhNoController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController addmissionNumberController = TextEditingController();
  TextEditingController studentemailController = TextEditingController();
  AddStudentTea({this.schoolID, required this.teacherID, super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: Text('ADD STUDENT')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
          child: Center(
            child: Container(
              color: Colors.white,
              height: screenSize.width * 1 / 2.5,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: studentNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: GetClassesListDropDownButton(
                      schoolID: schoolID,
                      teacherID: teacherID,
                    )),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: studentemailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Student email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: parentNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Guardian Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: parentPhNoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Guardian Phone Number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: addmissionNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'AdmissionNumber',
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: screenSize.width * 1 / 15,
                    width: 400,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 3, 39, 68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        final studentDetails = AddStudentsModel(
                            studentemailController:
                                studentemailController.text.trim(),
                            id: studentemailController.text.trim(),
                            studentName: studentNameController.text.trim(),
                            wclass: classesListValue!["id"],
                            admissionNumber:
                                addmissionNumberController.text.trim(),
                            parentName: parentNameController.text.trim(),
                            parentPhNo: parentPhNoController.text.trim(),
                            joinDate: DateTime.now().toString());

                        await AddStudentsToFireBase().addStudentsController(
                            studentDetails,
                            context,
                            schoolID,
                            classesListValue!["id"]);
                      },
                      child: Text("Add Student"),
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
