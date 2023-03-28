import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../controllers/Getx/admin/notice_controller.dart';
import '../../../../../../model/admin_models/admin_notice_model/admin_notice_model.dart';

class AdminNoticeShow extends StatefulWidget {
  const AdminNoticeShow(
      {super.key, required this.schoolId, required this.adminNoticeModel});
  final String schoolId;

  final AdminNoticeModel adminNoticeModel;

  @override
  State<AdminNoticeShow> createState() => _AdminNoticeShowState();
}

class _AdminNoticeShowState extends State<AdminNoticeShow> {
  int _selectedContainerIndex = 0;
  AdminNoticeController adminNoticeController =
      Get.put(AdminNoticeController());

  @override
  void initState() {
    addValueToTextField();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 27, 95, 88),
        appBar: AppBar(title: Text('Add New Notice'.tr)),
        body: Obx(() {
          return adminNoticeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenSize.width * 1 / 13, bottom: 50),
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          height: screenSize.height * 1.5,
                          width: screenSize.width * 1 / 3,
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
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Venue'.tr,
                                    labelStyle: const TextStyle(
                                        color: Colors.black, fontSize: 16)),
                              ),
                            ),
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
                            InkWell(
                              onTap: () async {
                                final data =
                                    await adminNoticeController.photoUpdate(
                                        uid: widget
                                            .adminNoticeModel.signedImageId);
                                adminNoticeController.signedImageId = data;
                              },
                              child: Container(
                                height: screenSize.width * 1 / 40,
                                width: screenSize.width * 1 / 8,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                  child: adminNoticeController
                                          .signedImageUrl.isEmpty
                                      ? const Text('Uploaded')
                                      : Text(
                                          'Upload Sign'.tr,
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () async {
                                final data =
                                    await adminNoticeController.photoUpdate(
                                        uid: widget
                                            .adminNoticeModel.signedImageId);
                                adminNoticeController.imageId = data;
                              },
                              child: Container(
                                height: screenSize.width * 1 / 40,
                                width: screenSize.width * 1 / 8,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                    child:
                                        adminNoticeController.imageUrl.isEmpty
                                            ? const Text('Uploaded')
                                            : Text('Upload Notices'.tr)),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await adminNoticeController.updateAdminNotice(
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
                                      imageUrl:
                                          adminNoticeController.imageUrl.isEmpty
                                              ? widget.adminNoticeModel.imageUrl
                                              : adminNoticeController.imageUrl,
                                      signedImageUrl: adminNoticeController
                                              .signedImageUrl.isEmpty
                                          ? widget
                                              .adminNoticeModel.signedImageUrl
                                          : adminNoticeController
                                              .signedImageUrl,
                                      imageId:
                                          adminNoticeController.imageId.isEmpty
                                              ? widget.adminNoticeModel.imageId
                                              : adminNoticeController.imageId,
                                      signedImageId: adminNoticeController
                                              .signedImageId.isEmpty
                                          ? widget
                                              .adminNoticeModel.signedImageId
                                          : adminNoticeController.signedImageId,
                                      noticeId:
                                          widget.adminNoticeModel.noticeId,
                                      customContent: adminNoticeController
                                          .customContentController.text,
                                      visibleGuardian: adminNoticeController
                                          .guardianCheckBox.value,
                                      visibleStudent: adminNoticeController
                                          .studentCheckBox.value,
                                      visibleTeacher: adminNoticeController
                                          .teacherCheckBox.value,
                                    ),
                                    widget.schoolId);

                                setState(() {
                                  _selectedContainerIndex = 0;
                                });
                              },
                              child: Container(
                                height: screenSize.width * 1 / 30,
                                width: screenSize.width * 1 / 5,
                                decoration: BoxDecoration(
                                    color: _selectedContainerIndex == 0
                                        ? Colors.blue
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                  child: Text('Update'.tr,
                                      style: const TextStyle(fontSize: 17)),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                );
        }));
  }

  void addValueToTextField() {
    adminNoticeController.publishedDateController.text =
        widget.adminNoticeModel.publishedDate;
    adminNoticeController.headingController.text =
        widget.adminNoticeModel.heading;
    adminNoticeController.dateOfOccasionController.text =
        widget.adminNoticeModel.dateofoccation;
    adminNoticeController.venueController.text = widget.adminNoticeModel.venue;
    adminNoticeController.chiefGuestController.text =
        widget.adminNoticeModel.chiefGuest;
    adminNoticeController.dateOfSubmissionController.text =
        widget.adminNoticeModel.dateOfSubmission;
    adminNoticeController.signedByController.text =
        widget.adminNoticeModel.signedBy;
    adminNoticeController.imageId = widget.adminNoticeModel.imageId;
    adminNoticeController.imageUrl = widget.adminNoticeModel.imageUrl;
    adminNoticeController.signedImageId = widget.adminNoticeModel.signedImageId;
    adminNoticeController.signedImageUrl =
        widget.adminNoticeModel.signedImageUrl;
    adminNoticeController.studentCheckBox.value =
        widget.adminNoticeModel.visibleStudent;
    adminNoticeController.teacherCheckBox.value =
        widget.adminNoticeModel.visibleTeacher;
    adminNoticeController.guardianCheckBox.value =
        widget.adminNoticeModel.visibleGuardian;
  }
}
