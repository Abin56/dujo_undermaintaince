import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/subscribed_students_rec_live/subscibed_students_model.dart';
import 'package:dujo_website/view/colors/colors.dart';
import 'package:dujo_website/view/pages/widgets/button_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetRECandLIVESubscribedStudents extends StatelessWidget {
  const GetRECandLIVESubscribedStudents({Key? key}) : super(key: key);
  String lisofCourse(List<GetRECandLIVECourseSubScribedUserModel> listofCourses) {
    return listofCourses.map((e) => e.courseName).toList().join(',');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:dujothemeColor ,
        title: Text(
          'Subscribed Students',
          style: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("UserRECPaymentModel")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 1000,
                    width: 500,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = (snapshot.data!.docs[index]
                                  .data()['listofCourse'] as List)
                              .map((e) {
                            return GetRECandLIVECourseSubScribedUserModel.fromJson(
                                e);
                          }).toList();

                          return GestureDetector(
                            onTap: () {},
                            child: ButtonContainerWidget(
                                curving: 30,
                                colorindex: 0,
                                height: 150,
                                width: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Name :',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            data.first.userName,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'email :',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            data.first.useremail,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'course :',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            lisofCourse(data),
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snapshot.data!.docs.length),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              }),
        ),
      ),
    );
  }
}

Future<dynamic> deleteCategory(
    {required context, required uid, required userName}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert"),
        content: const Text(
          "Are You Sure to remove this Student ?",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection("UserPaymentModel")
                    .doc(uid)
                    .delete()
                    .then((value) => Navigator.pop(context));
              },
              child: const Text("Ok")),
        ],
      );
    },
  );
}
