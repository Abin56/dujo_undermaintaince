import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/pTA_section/pta_category_model.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/add_PTAMembers.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/add_PTA_Category.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/sample.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PtaMemberAdmin extends StatefulWidget {
  var id;
  PtaMemberAdmin({required this.id, super.key});

  @override
  State<PtaMemberAdmin> createState() => _PtaMemberAdminState();
}

class _PtaMemberAdminState extends State<PtaMemberAdmin> {
  bool _showContainer= false ;
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
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("SchoolListCollection")
                                .doc(widget.id)
                                .collection("PTACategoryCollection")
                                .snapshots(),
                            builder: (context, snapshots) {
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    final data = AddPTACategoryModel.fromJson(
                                        snapshots.data!.docs[index].data());
                                    return GestureDetector(
                                      onTap: () {
                                        print('working');
                                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                              SamplePage(),
                              ),
                            );
                                        Stack(
                                          children: [
                                            Positioned(
                                              top: 100,
                                              bottom: 0,
                                              right: 300,
                                              left: 10,
                                              child: Container(
                                                height: 1000,
                                                width: 500,
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        );
                                        setState(() {
                                          _showContainer =!_showContainer;
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 50, 49, 61),
                                                blurRadius: 2,
                                                spreadRadius: 1,
                                                offset: Offset(5, 5)),
                                          ],
                                          color: Color.fromARGB(255, 1, 238, 255),
                                        ),
                                        child:  Center(
                                            child: Text(data.ptaCategory)),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 20,
                                    );
                                  },
                                  itemCount: snapshots.data!.docs.length);
                            })),
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
                                    AddPtaMembersScreen(id: widget.id),
                              ),
                            );
                          },
                          child: Container(
                              height: screenSize.width * 1 / 10,
                              width: screenSize.width * 1 / 3.7,
                              child: CustomButton(
                                text: "Create Members",
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddPTACategoryAcreen(
                                            id: widget.id,
                                          )),
                                );
                              },
                              child: Container(
                                height: screenSize.width * 1 / 10,
                                width: screenSize.width * 1 / 3.7,
                                child: CustomButton(
                                  text: 'Create PTA Category',
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
                              Container(
                                width: 100,
                                height: 100,
                                child: Visibility(
                                  visible:_showContainer,
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  child:Text("hello") ,
                                ),
                              ),
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
