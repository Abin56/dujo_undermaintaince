import 'package:dujo_website/model/create_classModel/addStudent_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddAStudent extends StatelessWidget {
   AddAStudent({super.key, required this.classId, required this.schoolId }); 

   String schoolId; 
   String classId;

   TextEditingController studentNameController = TextEditingController();
  TextEditingController classNameController = TextEditingController();
  TextEditingController admissionNumberController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentPhoneController = TextEditingController(); 
  TextEditingController joinDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; 
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 9),
          child: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: studentNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Student Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: classNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Class',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: admissionNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Admission number',
                  ),
                ),
              ), 
                Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: parentNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Parent Name',
                  ),
                ),
              ), 
                Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: parentPhoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Parent Phone Number',
                  ),
                ),
              ),
                Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: joinDateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Join Date',
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
                   final studentDetails = 
                   await AddStudentsModel(id: studentNameController.text.trim()+admissionNumberController.text, studentName: studentNameController.text, wclass: classNameController.text, admissionNumber: admissionNumberController.text, parentName: parentNameController.text, parentPhNo: parentPhoneController.text, joinDate: joinDateController.text);
                    AddStudentsToFireBase().addStudentsController(studentDetails, context, schoolId, classId);
                   
                  },
                  child: const Text("Add Student"),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}