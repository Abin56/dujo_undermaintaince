import 'package:dujo_website/model/parent/parent_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddParent extends StatelessWidget {
  AddParent({super.key, required this.schoolID});

  String schoolID;

  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentemailController = TextEditingController();
  TextEditingController parentPhoneNumberController = TextEditingController();

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
                  controller: parentPhoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Parent Phone Number',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: parentemailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Parent email',
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
                    final parentDetails = await ParentModel(
                        parentEmail: parentemailController.text.trim(),
                        parentPhoneNumber:
                            parentPhoneNumberController.text.trim(),
                        parentName: parentNameController.text,
                        joinDate: DateTime.now().toString());

                    CreateParentsAddToFireBase().createSchoolController(
                        parentDetails, context, schoolID);
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
