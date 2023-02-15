// ignore_for_file: file_names

import 'package:dujo_website/view/pages/Login/students/students_login_screen.dart';
import 'package:dujo_website/view/pages/widgets/button_container_widget.dart';
import 'package:dujo_website/view/pages/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../fonts/fonts.dart';
import 'Admin/admin_login_screen.dart';
import 'faculty/faculty_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                        height: height,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: height,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/lepdujo.png"))),
                            )
                          ],
                        )),
                  ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const StudentsLoginScreen();
                        },
                      ));
                    },
                    child: ButtonContainerWidget(
                        curving: 30,
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text(
                            "Students Login",
                            style: GoogleFont.subHeadTextStyle,
                          ),
                        ),
                        colorindex: 0,
                        height: 200,
                        width: 400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const FacultyLoginScreen();
                        },
                      ));
                    },
                    child: ButtonContainerWidget(
                        curving: 30,
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text("Faculty Login",
                              style: GoogleFont.subHeadTextStyle),
                        ),
                        colorindex: 1,
                        height: 200,
                        width: 400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const AdminLoginScreen();
                        },
                      ));
                    },
                    child: ButtonContainerWidget(
                        curving: 30,
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text("Admin Login",
                              style: GoogleFont.subHeadTextStyle),
                        ),
                        colorindex: 7,
                        height: 200,
                        width: 400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
