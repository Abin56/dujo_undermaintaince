import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/pTA_section/add_PTAMemberModel.dart';
import 'package:dujo_website/model/pTA_section/pta_category_model.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/add_PTAMembers.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/add_PTA_Category.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/sample.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/Getx/pta_category_list/pta_category_memberslist.dart';

class PtaMemberAdmin extends StatefulWidget {
  var id;
  PtaMemberAdmin({required this.id, super.key});

  @override
  State<PtaMemberAdmin> createState() => _PtaMemberAdminState();
}

class _PtaMemberAdminState extends State<PtaMemberAdmin> {
  final getxController = Get.put(PTACategoeyMembersList());
  String name = '';
  int lenth = 0;
  bool _showContainer = false;
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
                                .collection("PTAMembersCollection")
                                .snapshots(),
                            builder: (context, snapshots) {
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    final data = AddPTACategoryModel.fromJson(
                                        snapshots.data!.docs[index].data());
                                    return GestureDetector(
                                      onTap: () {
                                        // var memberData;
                                        GetBuilder<PTACategoeyMembersList>(
                                          init: getxController,
                                          initState: (_) {},
                                          builder: (_) {
                                            return getxController
                                                    .categoryCollections.isEmpty
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                                : StreamBuilder(
                                                    stream: getxController
                                                        .getProduct(
                                                            data.ptaCategory,
                                                            widget.id),
                                                    builder:
                                                        (context, snapshotss) {
                                                      final  memberData  = snapshotss.data![index];
                                                      setState(() {
                                                        name = memberData.userName;
                                                        lenth = snapshotss.data!.length;
                                                      });
                                                      return Text('');
                                                      
                                                    },
                                                  );
                                          },
                                        );
                                        setState(() {
                                          _showContainer = !_showContainer;
                                          // name = memberData;
                                          lenth = snapshots.data!.docs.length;
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 50, 49, 61),
                                                blurRadius: 2,
                                                spreadRadius: 1,
                                                offset: Offset(5, 5)),
                                          ],
                                          color:
                                              Color.fromARGB(255, 1, 238, 255),
                                        ),
                                        child: Center(
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
                                  visible: _showContainer,
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          color: Colors.red,
                                          height: 100,
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(name),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider();
                                      },
                                      itemCount: lenth),
                                ),
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
