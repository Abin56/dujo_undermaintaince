import 'package:dujo_website/model/create_classModel/addStudent_model.dart';
import 'package:dujo_website/model/guardian/guardian_model.dart';
import 'package:flutter/material.dart';

class AddGuardian extends StatelessWidget {
  AddGuardian({super.key, required this.schoolId});

  String schoolId;

  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianIDController = TextEditingController();
  TextEditingController guardianEmailController = TextEditingController();
  TextEditingController guardianPhoneNoController = TextEditingController();

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
                    labelText: 'Guardian PhoneNumber',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: guardianEmailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Guardian email',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: guardianPhoneNoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Guardian Id'),
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
                    final guardianDetails = await GuardianModel(
                      guardianID: guardianEmailController.text.trim(),
                      joinDate: DateTime.now().toString(),
                      guardianEmail: guardianEmailController.text.trim(),
                      guardianPhoneNumber:
                          guardianPhoneNoController.text.trim(),
                      id: guardianIDController.text,
                      guardianName: guardianNameController.text.trim(),
                    );
                    CreateGuardiansAddToFireBase().createSchoolController(
                        guardianDetails, context, schoolId);
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
