import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/custom_button.dart';

class PtaMemberAdmin extends StatefulWidget {
  const PtaMemberAdmin({super.key});

  @override
  State<PtaMemberAdmin> createState() => _PtaMemberAdminState();
}

class _PtaMemberAdminState extends State<PtaMemberAdmin> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
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
                        "PTA MEMBERS",
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
                    padding: const EdgeInsets.all(25),
                    child: Container(
                        width: screenSize.width * 1 / 3.3,
                        height: screenSize.width * 1 / 2.09,
                        // height: screenSize.width * 1 / 4,
                        //color: Colors.blue,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 2, 0, 27),
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(5, 5)),
                          ],
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
                        child: Column(children: [
                          Text(
                            "List of Members",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 50, 49, 61),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(5, 5)),
                              ],
                              color: Color.fromARGB(255, 1, 238, 255),
                            ),
                            child: const Center(child: Text('President')),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 50, 49, 61),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(5, 5)),
                              ],
                              color: Color.fromARGB(255, 1, 238, 255),
                            ),
                            child: const Center(child: Text('Vice President')),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 50, 49, 61),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(5, 5)),
                              ],
                              color: Color.fromARGB(255, 1, 238, 255),
                            ),
                            child: const Center(child: Text('Secretary')),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ])),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         ,
                            //   ),
                            // );
                          },
                          child: Container(
                              height: screenSize.width * 1 / 10,
                              width: screenSize.width * 1 / 3.7,
                              child: CustomButton(
                                text: "Create Members",
                                onTap: () {},
                              )
                              // color: Colors.red,
                              ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3.7,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //        Meeting,
                                //   ),
                                // );
                              },
                              child: Container(
                                height: screenSize.width * 1 / 10,
                                width: screenSize.width * 1 / 3.7,
                                child: CustomButton(
                                  text: 'Edit Members',
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //         NoticeUpdates(),
                            //   ),
                            // );
                          },
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3.7,
                            child: CustomButton(
                              text: 'Remove Members',
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Container(
                            width: screenSize.width * 1 / 3.3,
                            height: screenSize.width * 1 / 2.09,
                            // height: screenSize.width * 1 / 4,
                            //color: Colors.blue,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                // BoxShadow(
                                //     color: Colors.blue,
                                //     blurRadius: 1,
                                //     spreadRadius: 3,
                                //     offset: Offset(0, 0)),
                                BoxShadow(
                                    color: Color.fromARGB(255, 2, 0, 20),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(5, 5)),
                              ],
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
                            child: Column(children: [
                              Text(
                                "Members",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150'),
                                  backgroundColor: Colors.blue,
                                ),
                                color: Colors.transparent,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 50, 49, 61),
                                        blurRadius: 2,
                                        spreadRadius: 1,
                                        offset: Offset(5, 5)),
                                  ],
                                  color: Color.fromARGB(255, 1, 238, 255),
                                ),
                                child: const Center(child: Text('Name')),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color.fromARGB(255, 1, 238, 255),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 50, 49, 61),
                                        blurRadius: 2,
                                        spreadRadius: 1,
                                        offset: Offset(5, 5)),
                                  ],
                                ),
                                child: const Center(child: Text('Address')),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 50, 49, 61),
                                        blurRadius: 2,
                                        spreadRadius: 1,
                                        offset: Offset(5, 5)),
                                  ],
                                  color: Color.fromARGB(255, 1, 238, 255),
                                ),
                                child: const Center(child: Text('mobile')),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ])),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
