import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/Getx/student_list_controller.dart';
import '../../../../../../model/guardian/guardian_data_model.dart';
import '../../../../../../model/parent/parent_data_model.dart';
import '../../../../../../model/student/student_list_model.dart';
import '../../../../../constants/const.dart';

import '../../../../../../utils/utils.dart';

final ClassTeacherStudentListController classTeacherStudentListController =
    Get.put(ClassTeacherStudentListController());

void getStudentData(
    {required context,
    required StudentData studentData,
    required schoolId,
    required classId}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: CloseButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              studentData.studentImage,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(children: [
              SingleChildScrollView(
                child: DataTable(columns: const [
                  DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(
                    label: Text(''),
                  ),
                ], rows: [
                  DataRow(cells: [
                    const DataCell(Text('Address')),
                    DataCell(Text(studentData.address)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Admission Number')),
                    DataCell(Text(studentData.admissionNumber)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Blood Group')),
                    DataCell(Text(studentData.bloodGroup)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Gurdian Name')),
                    DataCell(Text(studentData.gurdianName)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Id')),
                    DataCell(Text(studentData.id)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Join Date')),
                    DataCell(
                      Text(
                        stringTimeToDateConvert(studentData.joinDate),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(
                      Text('Parent Name'),
                    ),
                    DataCell(
                      Text(studentData.parentName),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(
                      Text('Phone Number'),
                    ),
                    DataCell(Row(
                      children: [
                        Text(studentData.parentPhNo),
                        IconButton(
                          onPressed: () {
                            editNumber(context, studentData.id, classId,
                                schoolId, studentData.parentPhNo, 'student');
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 15,
                          ),
                        )
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Roll No')),
                    DataCell(Text(studentData.rollNo)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Student Class')),
                    DataCell(Text(studentData.studentClass)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Student Name')),
                    DataCell(Text(studentData.studentName)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Student Email')),
                    DataCell(Text(studentData.studentemailController)),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('W class')),
                    DataCell(Text(studentData.wclass)),
                  ]),
                ]),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final guardianData =
                            await classTeacherStudentListController
                                .getClassTeacherWiseStudenGuardianData(
                                    schoolId: schoolId,
                                    studentDataId: studentData.id);
                        if (context.mounted) {
                          getGuardianData(
                            studentData,
                            schoolId,
                            context: context,
                            guardianDataModel: guardianData,
                          );
                        }
                      },
                      child: const Text('Guardian Details'),
                    ),
                    sizedBoxW20,
                    ElevatedButton(
                      onPressed: () async {
                        final parentData =
                            await classTeacherStudentListController
                                .getClassTeacherWiseStudenParentData(
                                    schoolId: schoolId,
                                    studentDataId: studentData.id);

                        if (context.mounted) {
                          getParentData(
                            studentData,
                            schoolId,
                            parentDataModel: parentData,
                            context: context,
                          );
                        }
                      },
                      child: const Text('Parent Details'),
                    ),
                    sizedBoxW20,
                    ElevatedButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Conform Remove'),
                                content: const Text(
                                    'Are you sure you want to remove this student'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final bool result =
                                          await classTeacherStudentListController
                                              .removeStudentData(
                                        studentData.id,
                                        classId,
                                        schoolId,
                                      );
                                      if (result) {
                                        if (context.mounted) {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          showToast(
                                              msg: 'Successfully Removed');
                                        }
                                      }
                                    },
                                    child: const Text('Remove'),
                                  )
                                ],
                              );
                            });
                      },
                      child: const Text(
                        "Remove Student",
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      });
}

getGuardianData(
  StudentData studentData,
  String schoolId, {
  required context,
  required GuardianDataModel guardianDataModel,
}) async {
  await showDialog(
      context: context,
      builder: (context1) {
        return AlertDialog(
          icon: CloseButton(
            onPressed: () {
              Navigator.pop(context1);
            },
          ),
          title: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              guardianDataModel.guardianImage,
            ),
          ),
          content: SingleChildScrollView(
            child: DataTable(columns: const [
              DataColumn(
                label: Text(''),
              ),
              DataColumn(
                label: Text(''),
              ),
            ], rows: [
              DataRow(cells: [
                const DataCell(Text('Gender')),
                DataCell(Text(guardianDataModel.gender)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Guardian Email')),
                DataCell(Text(guardianDataModel.guardianEmail)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Guardian Name')),
                DataCell(Text(guardianDataModel.guardianName)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Gurdian Phone Number')),
                DataCell(Row(
                  children: [
                    Text(guardianDataModel.guardianPhoneNumber),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                      onPressed: () {
                        log('Button Pressed');

                        editNumber(
                            context1,
                            studentData.id,
                            studentData.wclass,
                            schoolId,
                            guardianDataModel.guardianPhoneNumber,
                            'guardian');
                      },
                    )
                  ],
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text('House Name')),
                DataCell(Text(guardianDataModel.houseName)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Id')),
                DataCell(Text(guardianDataModel.id)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Join Date')),
                DataCell(
                  Text(
                    stringTimeToDateConvert(guardianDataModel.joinDate),
                  ),
                ),
              ]),
              DataRow(cells: [
                const DataCell(Text('Pincode')),
                DataCell(Text(guardianDataModel.pincode)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Place')),
                DataCell(Text(guardianDataModel.place)),
              ]),
              DataRow(cells: [
                const DataCell(Text('State')),
                DataCell(Text(guardianDataModel.state)),
              ]),
              DataRow(cells: [
                const DataCell(Text('W student')),
                DataCell(Text(guardianDataModel.wStudent)),
              ]),
            ]),
          ),
        );
      });
}

getParentData(StudentData studentData, String schoolId,
    {required ParentDataModel parentDataModel, required context}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: CloseButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              parentDataModel.parentImage,
            ),
          ),
          content: SingleChildScrollView(
            child: DataTable(columns: const [
              DataColumn(
                label: Text(''),
              ),
              DataColumn(
                label: Text(''),
              ),
            ], rows: [
              DataRow(cells: [
                const DataCell(Text('Gender')),
                DataCell(Text(parentDataModel.gender)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Guardian Name')),
                DataCell(Text(parentDataModel.guardianName)),
              ]),
              DataRow(cells: [
                const DataCell(Text('House Name')),
                DataCell(Text(parentDataModel.houseName)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Join Date')),
                DataCell(
                  Text(
                    stringTimeToDateConvert(parentDataModel.joinDate),
                  ),
                ),
              ]),
              DataRow(cells: [
                const DataCell(Text('Name of father')),
                DataCell(Text(parentDataModel.nameofFather)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Name of Mother')),
                DataCell(Text(parentDataModel.nameofMother)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Parent Email')),
                DataCell(Text(parentDataModel.parentEmail)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Parent Name')),
                DataCell(Text(parentDataModel.parentName)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Parent Phone Number')),
                DataCell(Row(
                  children: [
                    Text(parentDataModel.parentPhoneNumber),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                      onPressed: () {
                        editNumber(
                            context,
                            studentData.id,
                            studentData.wclass,
                            schoolId,
                            parentDataModel.parentPhoneNumber,
                            'parent');
                      },
                    )
                  ],
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text('Pincode')),
                DataCell(Text(parentDataModel.pincode)),
              ]),
              DataRow(cells: [
                const DataCell(Text('Place')),
                DataCell(Text(parentDataModel.place)),
              ]),
              DataRow(cells: [
                const DataCell(Text('State')),
                DataCell(Text(parentDataModel.state)),
              ]),
              DataRow(cells: [
                const DataCell(Text('W Student')),
                DataCell(Text(parentDataModel.wStudent)),
              ]),
            ]),
          ),
        );
      });
}

void editNumber(BuildContext context, String studentId, String classId,
    String schoolId, String previousNumber, String whichPage) async {
  TextEditingController textEditingControllerPhoneNumber =
      TextEditingController();
    /*same function used three different situations it work with whichPage data
    Student detail, Parent Detail, Guardian detail these pages mobile number updated
    function.*/ 
  showDialog(
      context: context,
      builder: (context) {
        textEditingControllerPhoneNumber.text = previousNumber;
        return AlertDialog(
            content: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(20)),
                controller: textEditingControllerPhoneNumber,
              ),
              sizedBoxH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      bool result = false;
                      if (whichPage == 'student') {
                        result = await classTeacherStudentListController
                            .updateStudentParentPhoneNumber(
                          stuentId: studentId,
                          classId: classId,
                          schoolId: schoolId,
                          newPhoneNumber: textEditingControllerPhoneNumber.text,
                        );
                      } else if (whichPage == 'guardian') {
                        result = await classTeacherStudentListController
                            .updateGuardianPhoneNumber(
                          stuentId: studentId,
                          schoolId: schoolId,
                          newPhoneNumber: textEditingControllerPhoneNumber.text,
                        );
                      } else if (whichPage == 'parent') {
                        result = await classTeacherStudentListController
                            .updateParentPhoneNumber(
                                stuentId: studentId,
                                schoolId: schoolId,
                                newPhoneNumber:
                                    textEditingControllerPhoneNumber.text);
                      }

                      if (result) {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }

                        if (whichPage == 'guardian' || whichPage == 'parent') {
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        }

                        showToast(msg: "Successfully Mobile Number Updated");
                        textEditingControllerPhoneNumber.clear();
                      } else {
                        showToast(msg: "Mobile Number Not Updated");
                      }
                    },
                    child: const Text('Update'),
                  ),
                  sizedBoxW20,
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'))
                ],
              ),
            ],
          ),
        ));
      });
}
