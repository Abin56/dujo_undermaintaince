import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/guardian/guardian_model.dart';
import 'package:dujo_website/model/parent/parent_model.dart';
import 'package:dujo_website/view/pages/Login/Admin/parents-section/add_parent.dart';
import 'package:dujo_website/view/pages/Login/Admin/parents-section/edit_parent_details.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdminParentPanelSCreen extends StatelessWidget {
  AdminParentPanelSCreen({super.key, required this.id});

  var id;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => AddGuardian(schoolId: id, ),
                      //   ),
                      // );
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
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("SchoolListCollection")
                                .doc(id)
                                .collection("Students_Parents")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final data = ParentModel.fromJson(
                                          snapshot.data!.docs[index].data());

                                      return InkWell(
                                        onTap: () async {
                                          await showParentDetails(
                                              context: context,
                                              parentmodel: data,
                                              id: id);
                                          // await showGuardianDetails(
                                          //     context: context,
                                          //     id:id,
                                          //     // guardianID: data.guardianID,
                                          //     // guardianName: data.guardianName,
                                          //     // joinDaTE: data.joinDate,
                                          //     // classIncarge: data.classIncharge);
                                          //     guardianModel: data);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 400,
                                          color:
                                              Color.fromARGB(255, 1, 238, 255),
                                          child: Center(
                                              child: Text(data.parentName)),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemCount: snapshot.data!.docs.length);
                              } else {
                                return Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                            })),
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
                                  AddParent(schoolID: id),
                            ),
                          );
                        },
                        child: Container(
                          height: screenSize.width * 1 / 10,
                          width: screenSize.width * 1 / 3,
                          child: CustomContainer(
                            text: 'Add Parent',
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         const NoticeUpdates(),
                      //   ),
                      // );
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
      ),
    );
  }
}

showParentDetails(
    {required context, required ParentModel parentmodel, required id}) async {
  return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Guardian Details'),
            actions: [
              TextButton(
                child: Text('EDIT'),
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => EditParentDetails(
                  //               model: parentmodel,
                  //               id: id,
                  //             ))));
                },
              ),
              TextButton(
                child: Text('REMOVE'),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('SchoolListCollection')
                      .doc(id)
                      .collection('Students_Parents')
                      .doc(parentmodel.parentEmail)
                      .delete();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
            content: SingleChildScrollView(
                child: ListBody(children: <Widget>[
              Row(
                children: [
                  Text('Name :'),
                  Text(parentmodel.parentName),
                ],
              ),
              Row(
                children: [
                  Text('ID :'),
                ],
              ),
              Row(
                children: [
                  Text('ClassIncharge :'),
                ],
              ),
              Row(
                children: [
                  Text('Date :'),
                  Text(parentmodel.joinDate),
                ],
              )
            ])));
      });
}
