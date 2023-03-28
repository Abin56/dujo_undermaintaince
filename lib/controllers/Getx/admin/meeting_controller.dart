import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/admin_models/admin_meeting_model/admin_meeting_model.dart';
import '../../../utils/utils.dart';

class AdminMeetingController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController categoryOfMeetingController = TextEditingController();
  TextEditingController membersTobeExpectedController = TextEditingController();
  TextEditingController specialGuestController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Future<void> addAdminMeeting(
      String schoolId, AdminMeetingModel adminMeeting) async {
    try {
      isLoading.value = true;
      final data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('AdminMeeting')
          .add(
            adminMeeting.toJson(),
          );
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('AdminMeeting')
          .doc(data.id)
          .update({"meetingId": data.id});
      clearControllers();
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

//update meeting details
  Future<void> updateMeetingData(
      {required String schoolId,
      required AdminMeetingModel adminMeetingModel,
      required String documentId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('AdminMeeting')
          .doc(documentId)
          .update(
            adminMeetingModel.toJson(),
          );
      clearControllers();
      isLoading.value = false;
      showToast(msg: 'Successfully Updated');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(
        msg: e.toString(),
      );

      print(e.toString());
    }
  }

  Future<void> deleteMeeting(
      {required String schoolId,
      required String documentId,
      required BuildContext context}) async {
    try {
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('AdminMeeting')
          .doc(documentId)
          .delete();
      showToast(msg: 'Successfully Removed');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(msg: e.toString());
    }
  }

  void clearControllers() {
    dateController.clear();
    headingController.clear();
    categoryOfMeetingController.clear();
    membersTobeExpectedController.clear();
    specialGuestController.clear();
    timeController.clear();
    venueController.clear();
  }
}
