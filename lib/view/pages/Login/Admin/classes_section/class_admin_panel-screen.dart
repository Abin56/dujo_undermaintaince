import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/create_classModel/create_classModel.dart';
import 'package:dujo_website/view/pages/Login/Admin/classes_section/add_classes.dart';
import 'package:dujo_website/view/pages/Login/Admin/classes_section/onTap_class.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_blue_button.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AdminClasses extends StatelessWidget {
  var id;
   AdminClasses({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Class')),
      backgroundColor: const Color(0xFF26A69A),
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
                children: const [
                  Text(
                    "Admin Dashboard",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 30, bottom: 30),
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
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF26A69A),
                            Color.fromARGB(255, 9, 49, 45),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("SchoolListCollection")
                            .doc(id)
                            .collection("Classes")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  final data = AddClassesModel.fromJson(
                                      snapshot.data!.docs[index].data());
                                  return SizedBox(
                                    height: screenSize.width * 1 / 20,
                                    width: screenSize.width * 1 / 6,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 3, 39, 68),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () {
                                        print('Abinjohn14276');
                                        log('Abinjohn14276');
                                                      print('Worng>>>>>>>>>>>>>>>>');
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return OnTapClassDetailsScreen(
                                            id: id,
                                            className: data.className,
                                            classID: data.classID,
                                            classiNCharge:
                                                data.classIncharge);
                                      },
                                    ));
                                      },
                                      child: Text(data.className),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: snapshot.data!.docs.length);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                        }),
                  ),
                ),
                const SizedBox(
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
                        gradient: const LinearGradient(
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
                                  builder: (context) => AddClasses(id: id),
                                ));
                          },
                          child: SizedBox(
                              height: screenSize.width * 1 / 12,
                              width: screenSize.width * 1 / 4,
                              child: CustomButton(
                                text: 'Create Classes',
                             
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
                        gradient: const LinearGradient(
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
                          padding: const EdgeInsets.only(top: 150),
                          child: Container(
                            height: screenSize.width * 1 / 30,
                            width: screenSize.width * 1 / 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFF26A69A),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 238, 238, 238)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: DropdownButton(
                              onChanged: (value) {},
                              hint: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Select Class Division",
                                  style: TextStyle(
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
                            ),
                          ),
                        ),
                        const SizedBox(
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
                        const SizedBox(
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
      ),
    );
  }
}
