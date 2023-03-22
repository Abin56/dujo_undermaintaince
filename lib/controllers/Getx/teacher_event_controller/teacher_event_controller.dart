import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/class_teacher/class_teacher_event_model.dart';

class TeacherEventController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController chiefGuestController = TextEditingController();
  final TextEditingController participantsController = TextEditingController();
  RxBool isLoading = false.obs;
  //create events

  Future<void> createEvents({
    required String schoolId,
    required String classId,
    required ClassTeacherEventModel classTeacherEventModel,
  }) async {
    //creating new event

    try {
      isLoading.value = true;
      final result = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Events')
          .add(
            classTeacherEventModel.toJson(),
          );
//updating document id to firebase
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Events')
          .doc(result.id)
          .update({
        "eventId": result.id,
      });

      clearControllers();
      isLoading.value = false;
      showToast(msg: 'Successfully Creted');
    } catch (e) {
      showToast(msg: e.toString());
    }
  }

  Future<void> updateEvent(
      {required String schoolId,
      required String classId,
      required ClassTeacherEventModel classTeacherEventModel,
      required String documentId,
      required BuildContext context}) async {
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Events')
          .doc(documentId)
          .update(
            classTeacherEventModel.toJson(),
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
    }
  }

  Future<void> deleteEvent(
      {required String schoolId,
      required String classId,
      required String documentId,
      required BuildContext context}) async {
    try {
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('Classes')
          .doc(classId)
          .collection('Events')
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
    nameController.clear();
    dateController.clear();
    descriptionController.clear();
    venueController.clear();
    chiefGuestController.clear();
    participantsController.clear();
  }
}
