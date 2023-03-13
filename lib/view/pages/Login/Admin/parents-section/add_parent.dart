import 'package:dujo_website/model/parent/parent_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddParent extends StatelessWidget {
   AddParent({super.key, required this.schoolID}); 

  String schoolID; 

  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentIDController = TextEditingController();
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
                  controller: parentIDController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Parent ID',
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
                    final parentDetails = await
                     ParentModel(id: parentIDController.text, parentName: parentNameController.text, studentID: studentIDController.text, classIncharge: classInchargeController.text, parentID: parentIDController.text, joinDate: joinDateController.text);
                  //  final guardianDetails = await GuardianModel(id: guardianIDController.text,
                  //   guardianName: guardianNameController.text, studentID: studentIDController.text,
                  //    classIncharge: classInchargeController.text, guardianID: guardianIDController.text, joinDate: joinDateController.text); 
                  //    CreateGuardiansAddToFireBase().createSchoolController(guardianDetails, context, schoolId);
                   CreateParentsAddToFireBase().createSchoolController(parentDetails, context, schoolID);
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