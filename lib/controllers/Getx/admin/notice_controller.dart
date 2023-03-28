import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../model/admin_models/admin_notice_model/admin_notice_model.dart';

class AdminNoticeController extends GetxController {
  TextEditingController publishedDateController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController dateOfOccasionController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController chiefGuestController = TextEditingController();
  TextEditingController dateOfSubmissionController = TextEditingController();
  TextEditingController signedByController = TextEditingController();
  TextEditingController customContentController = TextEditingController();
  String imageUrl = '';
  String imageId = '';
  String signedImageUrl = '';
  String signedImageId = '';
  RxBool isLoading = false.obs;
  RxBool teacherCheckBox = false.obs;
  RxBool studentCheckBox = false.obs;
  RxBool guardianCheckBox = false.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //add admin notice to firebase

  void addAdminNotice(String schoolId, AdminNoticeModel adminNotice) async {
    try {
      isLoading.value = true;

      final data = await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('adminNotice')
          .add(
            adminNotice.toJson(),
          );
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('adminNotice')
          .doc(data.id)
          .update({"noticeId": data.id});
      clearControllers();

      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  //update notice data on firebase
  Future<void> updateAdminNotice(
      AdminNoticeModel adminNoticeModel, String schoolId) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      isLoading.value = true;
      await firebaseFirestore
          .collection('SchoolListCollection')
          .doc(schoolId)
          .collection('adminNotice')
          .doc(adminNoticeModel.noticeId)
          .update(adminNoticeModel.toJson());
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

//files uploaded to firebase
  Future<Map<String, String>> photoUpload() async {
    try {
      isLoading.value = true;
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        Uint8List? file = result.files.first.bytes;
        String uid = const Uuid().v1();
        //isImageUpload.value = true;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child("files/adminNotice/$uid")
            .putData(file!);

        final TaskSnapshot snap = await uploadTask;
        final String downloadUrl = await snap.ref.getDownloadURL();

        isLoading.value = false;
        return {
          "downloadUrl": downloadUrl,
          "imageUid": uid,
        };
      } else {
        return {};
      }
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  Future<String> photoUpdate({required String uid}) async {
    try {
      isLoading.value = true;
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        Uint8List? file = result.files.first.bytes;
        //isImageUpload.value = true;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child("files/adminNotice/$uid")
            .putData(file!);

        final TaskSnapshot snap = await uploadTask;
        final String downloadUrl = await snap.ref.getDownloadURL();
        isLoading.value = false;
        return downloadUrl;
      } else {
        return '';
      }
    } catch (e) {
      log(e.toString());
      return '';
    }
  }

  clearControllers() {
    publishedDateController.clear();
    headingController.clear();
    dateOfOccasionController.clear();
    venueController.clear();
    chiefGuestController.clear();
    dateOfSubmissionController.clear();
    signedByController.clear();
    imageUrl = '';
    imageId = '';
    signedImageUrl = '';
    signedImageId = '';
    teacherCheckBox.value = false;
    studentCheckBox.value = false;
    guardianCheckBox.value = false;
  }
}
