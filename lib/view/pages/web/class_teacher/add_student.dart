import 'package:flutter/material.dart';

import '../widgets/custom_blue_button.dart';

class AddStudentTea extends StatefulWidget {
  const AddStudentTea({super.key});

  @override
  State<AddStudentTea> createState() => _AddStudentTeaState();
}

class _AddStudentTeaState extends State<AddStudentTea> {
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
              height: screenSize.width * 1 / 3.5,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Admission Number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Guardian Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Guardian Phone Number',
                    ),
                  ),
                ),
                Container(
                  height: screenSize.width * 1 / 15,
                  width: 400,
                  child: CustomBlueButton(
                    text: "Update",
                    onPressed: () {},
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
