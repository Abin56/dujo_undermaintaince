import 'dart:math';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';

import '../../../../model/schools_to_be_verified/schools_to_be_verified_create_list.dart';
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

  TextEditingController phoneNumberController = TextEditingController(); 

  TextEditingController emailController = TextEditingController();

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
                 Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: emailController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: phoneNumberController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
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
                      final schoolDetails = SchoolsToBeVerified
                      (schoolName: schoolNameController.text, schoolID: schoolNameController.text.substring(0,5) + cityValue.substring(0,5) + schoolID ,
                      id: adminUserNameController.text.trim()+ schoolID,
                       district: cityValue.toString(),
                        place: placeController.text.trim(), 
                        adminUserName: adminUserNameController.text.trim(),
                         password: adminPasswordController.text.trim(),
                          phoneNumber: phoneNumberController.text, email: emailController.text, postedDate: DateTime.now().toString()); 

                          AddRequestedSchoolsToFirebase().addRequestedSchools(schoolDetails, context);
                      // final schoolDetails = CreatedSchoolAddModel(
                      //     id: adminUserNameController.text.trim() + schoolID,
                      //     schoolName: schoolNameController.text.trim(),
                      //     schoolID: adminUserNameController.text.trim() + schoolID,
                      //     district: cityValue.toString(),
                      //     place: placeController.text.trim(),
                      //     adminUserName: adminUserNameController.text.trim(),
                      //     password: adminPasswordController.text.trim(),
                      //     postedDate: DateTime.now().toString());

                      // CreateSchoolAddToFireBase()
                      //     .createSchoolController(schoolDetails, context);
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