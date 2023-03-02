import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/teacher/add_teacher.dart';
import 'package:dujo_website/view/pages/web/admin/add_teacher.dart';
import 'package:dujo_website/view/pages/web/admin/meeting_updates.dart';
import 'package:dujo_website/view/pages/web/admin/notices_updates.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class AdminTeacherList extends StatefulWidget {
  var id;
  AdminTeacherList({this.id, super.key});

  @override
  State<AdminTeacherList> createState() => _AdminTeacherListState();
}

class _AdminTeacherListState extends State<AdminTeacherList> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Title(
              color: Color.fromARGB(255, 3, 22, 37),
              child: Text("Admin Teacher")),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddTeacher(id: widget.id),
                          ),
                        );
                      },
                      child: Container(
                          width: screenSize.width * 1 / 3.3,
                          height: screenSize.width * 1 / 2.09,
                          // height: screenSize.width * 1 / 4,
                          //color: Colors.blue,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 14, 80, 73),
                                  Color(0xFF26A69A)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AddTeacher(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 400,
                                    color: Color.fromARGB(255, 1, 238, 255),
                                    child:
                                        const Center(child: Text('Teacher 1')),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: 3)),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AddTeacher(id: widget.id),
                              ),
                            );
                          },
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3,
                            child: CustomContainer(
                              text: 'Add Teacher',
                              onTap: () {},
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            // height: screenSize.width * 1 / 10,
                            // width: screenSize.width * 1 / 3,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MeetingUpdates(),
                                  ),
                                );
                              },
                              child: Container(
                                height: screenSize.width * 1 / 10,
                                width: screenSize.width * 1 / 3,
                                child: CustomContainer(
                                  text: 'Edit Teacher',
                                  onTap: () {},
                                ),
                                // color: Colors.red,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NoticeUpdates(),
                              ),
                            );
                          },
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3,
                            child: CustomContainer(
                              text: 'Remove Teacher',
                              onTap: () {},
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => NoticeUpdates(),
                          ),
                        );
                      },
                      child: Container(
                        width: screenSize.width * 1 / 4,
                        height: screenSize.width * 1 / 2.09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF26A69A),
                                Color.fromARGB(255, 9, 49, 45),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenSize.width * 1 / 16,
                              top: screenSize.width * 1 / 15),
                          child: Text(
                            "Class Status",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    // color: Colors.red,
                  )
                ],
              )

              //CustomButton(text: "jfjhfj", onPressed: () {})
            ],
          ),
        ));
  }
}


