import 'package:dujo_website/model/create_classModel/addStudent_model.dart';
import 'package:dujo_website/model/guardian/guardian_model.dart';
import 'package:flutter/material.dart';


class AddGuardian extends StatelessWidget {
   AddGuardian({super.key, required this.schoolId }); 

   String schoolId; 


   TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianIDController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController classInchargeController = TextEditingController();
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
                  controller: guardianNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Guardian Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: guardianIDController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Guardian ID',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: studentIDController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Student number',
                  ),
                ),
              ), 
                Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: classInchargeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Class In Charge'
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
                   final guardianDetails = await GuardianModel(id: guardianIDController.text,
                    guardianName: guardianNameController.text, studentID: studentIDController.text,
                     classIncharge: classInchargeController.text, guardianID: guardianIDController.text, joinDate: joinDateController.text); 
                     CreateGuardiansAddToFireBase().createSchoolController(guardianDetails, context, schoolId);
                  },
                  child: const Text("Add Guardian"),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}