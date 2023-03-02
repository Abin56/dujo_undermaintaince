import 'dart:math';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dujo_website/model/create_school_model/create_school_model.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_blue_button.dart';
import 'package:flutter/material.dart';

class SchoolProfile extends StatefulWidget {
  SchoolProfile({super.key});

  @override
  State<SchoolProfile> createState() => _SchoolProfileState();
}

class _SchoolProfileState extends State<SchoolProfile> {
  TextEditingController schoolNameController = TextEditingController();

  TextEditingController schoolIDController = TextEditingController();

  TextEditingController placeController = TextEditingController();

  TextEditingController adminUserNameController = TextEditingController();

  TextEditingController adminPasswordController = TextEditingController();

  String countryValue = '';
  String stateValue = '';
  String cityValue = '';
  String schoolID = '';
  creatSchoollID() async {
    var random = Random();
    String roomName = (random.nextInt(10000) + 10000).toString();
    // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    schoolID = roomName;
  }

  @override
  void initState() {
    creatSchoollID();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: Text('School Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
          child: Center(
            child: Container(
              color: Colors.white,
              height: screenSize.width * 1 / 2,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: schoolNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'School Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: SelectState(
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: placeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Place',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: adminUserNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Admin Username',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: adminPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  height: screenSize.width * 1 / 25,
                  width: screenSize.width * 1 / 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 39, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      final schoolDetails = CreatedSchoolAddModel(
                          id: schoolID,
                          schoolName: schoolNameController.text.trim(),
                          schoolID: adminUserNameController.text.trim() + schoolID,
                          district: cityValue.toString(),
                          place: placeController.text.trim(),
                          adminUserName: adminUserNameController.text.trim(),
                          password: adminPasswordController.text.trim(),
                          postedDate: DateTime.now().toString());

                      CreateSchoolAddToFireBase()
                          .createSchoolController(schoolDetails, context);
                    },
                    child: Text("Create"),
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
