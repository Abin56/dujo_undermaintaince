import 'package:dujo_website/view/pages/Login/Admin/adminMain_panel.dart';
import 'package:dujo_website/view/pages/Login/Admin/classes_section/add_classes.dart';
import 'package:dujo_website/view/pages/web/admin/fees_bills.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_blue_button.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../web/admin/admin_pannel_main.dart';

class AdminClasses extends StatefulWidget {
  var id;
  AdminClasses({this.id, super.key});

  @override
  State<AdminClasses> createState() => _AdminClassesState();
}

class _AdminClassesState extends State<AdminClasses> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Admin Class')),
        backgroundColor: Color(0xFF26A69A),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 2, color: Colors.white)),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //decoration:

                      child: Text(
                        "Admin Dashboard",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, top: 30, bottom: 30),
                    child: Container(
                        width: screenSize.width * 1 / 3.5,
                        height: screenSize.width * 1 / 2.09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: const [
                            // BoxShadow(
                            //     color: Colors.blue,
                            //     blurRadius: 1,
                            //     spreadRadius: 3,
                            //     offset: Offset(0, 0)),
                            BoxShadow(
                                color: Color.fromARGB(255, 1, 73, 33),
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(5, 5)),
                          ],
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF26A69A),
                                Color.fromARGB(255, 9, 49, 45),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: ListView(children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenSize.width * 1 / 20),
                              child: Text(
                                "List of Classes",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'LKG',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FeesBills()),
                                  );
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'UKG',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FeesBills()),
                                  );
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 1',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 2',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 3',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 4',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 5',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 6',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 7',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 8',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 9',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 10',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 11',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: screenSize.width * 1 / 20,
                              width: screenSize.width * 1 / 6,
                              child: CustomBlueButton(
                                text: 'Class 12',
                                onPressed: () {},
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ])),
                  ),
                  SizedBox(
                    width: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Container(
                        width: screenSize.width * 1 / 3.5,
                        height: screenSize.width * 1 / 2.09,
                        // height: screenSize.width * 1 / 4,
                        //color: Colors.blue,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF26A69A),
                                Color.fromARGB(255, 9, 49, 45),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        padding: const EdgeInsets.only(
                          top: 120,
                        ),
                        child: Column(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddClasses(),
                                  ));
                            },
                            child: Container(
                                height: screenSize.width * 1 / 12,
                                width: screenSize.width * 1 / 4,
                                child: CustomButton(
                                  text: 'Create Classes',
                                  onTap: () {},
                                )),
                          ),
                        ])),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Container(
                        width: screenSize.width * 1 / 3.5,
                        height: screenSize.width * 1 / 2.09,
                        // height: screenSize.width * 1 / 4,
                        //color: Colors.blue,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF26A69A),
                                Color.fromARGB(255, 9, 49, 45),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        padding: const EdgeInsets.only(
                          top: 50,
                        ),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 150),
                            child: Container(
                              height: screenSize.width * 1 / 30,
                              width: screenSize.width * 1 / 6,
                              decoration: BoxDecoration(
                                color: Color(0xFF26A69A),
                                border: Border.all(
                                    color: Color.fromARGB(255, 238, 238, 238)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: DropdownButton(
                                hint: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Select Class Division",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                underline: const SizedBox(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                icon: const Padding(
                                  padding: EdgeInsets.all(
                                    13,
                                  ),
                                  child: Icon(Icons.arrow_drop_down,
                                      size: 18, color: Colors.grey),
                                ),
                                isExpanded: true,
                                items: [
                                  "DIV A",
                                  "DIV B",
                                  "DIV C",
                                  "DIV D",
                                  "DIV E",
                                  "DIV F",
                                  "DIV G",
                                  "DIV H",
                                  "DIV I",
                                  "DIV J",
                                ].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    var yourVar = val.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Container(
                            height: screenSize.width * 1 / 18,
                            width: screenSize.width * 1 / 5,
                            // color: Colors.white,
                            //child: const Center(child: Text('Class Details')),
                            child: CustomBlueButton(
                              text: 'Class Details',
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ])),
                  ),
                  // CustomButton(
                  //   text: 'teacher',
                  //   onPressed: () {},
                  // )
                ],
              )
            ],
          ),
        ));
  }
}
