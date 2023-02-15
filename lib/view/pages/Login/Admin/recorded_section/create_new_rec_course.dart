// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:dujo_website/model/rec_course_addModel/rec_course_add_model.dart';
import 'package:dujo_website/view/colors/colors.dart';
import 'package:dujo_website/view/pages/widgets/button_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class CreateNewRecordedCourseScreen extends StatefulWidget {
const  CreateNewRecordedCourseScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewRecordedCourseScreen> createState() =>
      _CreateNewRecordedCourseScreenState();
}

class _CreateNewRecordedCourseScreenState
    extends State<CreateNewRecordedCourseScreen> {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController courseFeeContoller = TextEditingController();
  TextEditingController durationContoller = TextEditingController();
  TextEditingController courseIDContoller = TextEditingController();

  String timeText = "";
  String dateText = "";
  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if (mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void initState() {
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dujothemeColor,
          title: const Text("Create Recorded Course"),
        ),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 2700,
              width: 800,
              child: ListView(
                children: [
                  SizedBox(
                      height: 400,
                      width: 400,
                      child: LottieBuilder.asset(
                          "assets/images/72266-vr-learning.json")),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: courseNameController,
                    decoration: InputDecoration(
                        hintText: "Course Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: facultyController,
                    decoration: InputDecoration(
                        hintText: "Facultie Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: courseFeeContoller,
                    decoration: InputDecoration(
                        hintText: "Course Fee",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: durationContoller,
                    decoration: InputDecoration(
                        hintText: "Duration in days",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: courseIDContoller,
                    decoration: InputDecoration(
                        hintText: "Course ID ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final addtofirebase = RecordedCourseAddModel(
                          courseTitle: courseNameController.text.trim(),
                          facultyName: facultyController.text.trim(),
                          courseFee: courseFeeContoller.text.trim(),
                          id: '',
                          duration: durationContoller.text.trim(),
                          courseID: courseIDContoller.text.trim(),
                          postedDate: dateText,
                          postedTime: timeText);
                      RecordedCourseAddToFireBase()
                          .RecordedCourseController(addtofirebase, context);
                    },
                    child: ButtonContainerWidget(
                      curving: 30,
                      colorindex: 0,
                      height: 60,
                      width: 100,
                      child: const Center(
                        child: Text(
                          "Add Course",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
