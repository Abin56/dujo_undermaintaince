import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/view/constants/const.dart';
import 'package:flutter/material.dart';

class EditClassesDetailsScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var id;
  String className;
  String classID;
  String classiNCharge;
  EditClassesDetailsScreen(
      {required this.id,
      required this.className,
      required this.classID,
      required this.classiNCharge,
      super.key});

  TextEditingController newClassNameController = TextEditingController();

  TextEditingController newClassInChargeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('EDIT CLASSES')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 9),
          child: Center(
            child: Container(
              color: Colors.white,
              height: screenSize.width * 1 / 4,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: newClassNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Class Name : $className',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: newClassInChargeController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Class Incharge : $classiNCharge',
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 1 / 25,
                  width: screenSize.width * 1 / 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      final newClassName = newClassNameController.text.trim();
                      final newClassiNcharge =
                          newClassInChargeController.text.trim();
                      try {
                        final data = FirebaseFirestore.instance
                            .collection("SchoolListCollection")
                            .doc(id)
                            .collection("Classes")
                            .doc(classID);

                        if (newClassName.isNotEmpty &&
                            newClassiNcharge.isNotEmpty) {
                          await data.update({
                            "className": newClassName,
                            "classIncharge": newClassiNcharge,
                          }).then((value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Message'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('Successfully Updated'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        } else if (newClassName.isNotEmpty &&
                            newClassiNcharge.isEmpty) {
                          await data.update({
                            "className": newClassName,
                          }).then((value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Message'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('Successfully Updated'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        } else if (newClassName.isEmpty &&
                            newClassiNcharge.isNotEmpty) {
                          await data.update({
                            "classIncharge": newClassiNcharge,
                          }).then((value) {
                            return showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Message'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('Successfully Updated'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        }
                      } catch (e) {}
                    },
                    child: const Text("Update"),
                  ),
                ),
                sizedBoxH20,
                SizedBox(
                  height: screenSize.width * 1 / 25,
                  width: screenSize.width * 1 / 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      FirebaseFirestore.instance
                          .collection("SchoolListCollection")
                          .doc(id)
                          .collection("Classes")
                          .doc(classID)
                          .delete();
                    },
                    child: const Center(
                      child: Text('Remove Class'),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
