import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/Getx/admin/notice_controller.dart';
import '../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';

class AddNewNotices extends StatefulWidget {
  const AddNewNotices({super.key, required this.schoolId});
  final String schoolId;

  @override
  State<AddNewNotices> createState() => _AddNewNoticesState();
}

class _AddNewNoticesState extends State<AddNewNotices> {
  AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    adminNoticeController.clearControllers();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: Text('Add New Notice'.tr)),
      body: Obx(
        () {
          return adminNoticeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.width * 1 / 13, bottom: 50),
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        height: screenSize.height * 1.29,
                        width: screenSize.width * 1 / 3,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                controller: adminNoticeController
                                    .publishedDateController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Published Date'.tr,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                controller:
                                    adminNoticeController.headingController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Heading'.tr,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                controller: adminNoticeController
                                    .dateOfOccasionController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Date of occation'.tr,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                controller:
                                    adminNoticeController.venueController,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Venue'.tr,
                                    labelStyle: const TextStyle(
                                        color: Colors.black, fontSize: 16)),
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                controller:
                                    adminNoticeController.chiefGuestController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Chief Guest'.tr,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                controller: adminNoticeController
                                    .dateOfSubmissionController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Date of Submission'.tr,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                controller:
                                    adminNoticeController.signedByController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Signed by'.tr,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                controller: adminNoticeController
                                    .customContentController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Custom Notice Content'.tr,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Checkbox(
                                      value: adminNoticeController
                                          .studentCheckBox.value,
                                      onChanged: (value) {
                                        adminNoticeController.studentCheckBox
                                            .value = value ?? false;
                                      },
                                    ),
                                    const Text('Students')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: adminNoticeController
                                          .teacherCheckBox.value,
                                      onChanged: (value) {
                                        adminNoticeController.teacherCheckBox
                                            .value = value ?? false;
                                      },
                                    ),
                                    const Text('Teacher')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: adminNoticeController
                                          .guardianCheckBox.value,
                                      onChanged: (value) {
                                        adminNoticeController.guardianCheckBox
                                            .value = value ?? false;
                                      },
                                    ),
                                    const Text('Guardian')
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            adminNoticeController.signedImageUrl.isNotEmpty
                                ? const Text('Image Uploaded')
                                : InkWell(
                                    onTap: () async {
                                      final result = await adminNoticeController
                                          .photoUpload();
                                      adminNoticeController.signedImageUrl =
                                          result["downloadUrl"]!;
                                      adminNoticeController.signedImageId =
                                          result["imageUid"]!;
                                    },
                                    child: Container(
                                      height: screenSize.width * 1 / 40,
                                      width: screenSize.width * 1 / 8,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child:
                                          Center(child: Text('Upload Sign'.tr)),
                                    ),
                                  ),

                            const SizedBox(
                              height: 30,
                            ),

                            adminNoticeController.imageUrl.isNotEmpty
                                ? const Text('Image Uploaded')
                                : InkWell(
                                    onTap: () async {
                                      final result = await adminNoticeController
                                          .photoUpload();
                                      adminNoticeController.imageUrl =
                                          result["downloadUrl"]!;
                                      adminNoticeController.imageId =
                                          result["imageUid"]!;
                                    },
                                    child: Container(
                                      height: screenSize.width * 1 / 40,
                                      width: screenSize.width * 1 / 8,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Center(
                                          child: Text('Upload Notices'.tr)),
                                    ),
                                  ),

                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: screenSize.width * 1 / 30,
                              width: screenSize.width * 1 / 5,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(14)),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(9.0),
                                  textStyle: const TextStyle(fontSize: 17),
                                ),
                                onPressed: () async {
                                  adminNoticeController.addAdminNotice(
                                    widget.schoolId,
                                    AdminNoticeModel(
                                      publishedDate: adminNoticeController
                                          .publishedDateController.text,
                                      heading: adminNoticeController
                                          .headingController.text,
                                      dateofoccation: adminNoticeController
                                          .dateOfOccasionController.text,
                                      venue: adminNoticeController
                                          .venueController.text,
                                      chiefGuest: adminNoticeController
                                          .chiefGuestController.text,
                                      dateOfSubmission: adminNoticeController
                                          .dateOfSubmissionController.text,
                                      signedBy: adminNoticeController
                                          .signedByController.text,
                                      noticeId: '',
                                      imageUrl: adminNoticeController.imageUrl,
                                      signedImageUrl:
                                          adminNoticeController.signedImageUrl,
                                      imageId: adminNoticeController.imageId,
                                      signedImageId:
                                          adminNoticeController.signedImageId,
                                      customContent: adminNoticeController
                                          .customContentController.text,
                                      visibleGuardian: adminNoticeController
                                          .guardianCheckBox.value,
                                      visibleStudent: adminNoticeController
                                          .studentCheckBox.value,
                                      visibleTeacher: adminNoticeController
                                          .teacherCheckBox.value,
                                    ),
                                  );
                                },
                                child: Text('Create'.tr),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            // Text(
                            //   'OR'.tr,
                            //   style: const TextStyle(
                            //       fontSize: 20, color: Colors.black),
                            // ),

                            // const SizedBox(
                            //   height: 30,
                            // ),

                            // Container(
                            //   height: screenSize.width * 1 / 30,
                            //   width: screenSize.width * 1 / 5,
                            //   decoration: BoxDecoration(
                            //       gradient: const LinearGradient(colors: [
                            //         Color.fromARGB(255, 30, 252, 178),
                            //         Color.fromARGB(255, 91, 182, 151),
                            //         Color.fromARGB(255, 117, 192, 167),
                            //         Color.fromARGB(255, 43, 170, 128)
                            //       ]),
                            //       //color: Color.fromARGB(255, 8, 102, 71),
                            //       borderRadius: BorderRadius.circular(14)),
                            //   child: TextButton(
                            //     style: TextButton.styleFrom(
                            //       foregroundColor:
                            //           const Color.fromARGB(255, 255, 255, 255),
                            //       padding: const EdgeInsets.all(9.0),
                            //       textStyle: const TextStyle(fontSize: 17),
                            //     ),
                            //     onPressed: () {},
                            //     child: Text('Custom Notice'.tr),
                            //   ),
                            // ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
