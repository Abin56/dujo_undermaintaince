import 'package:dujo_website/view/colors/colors.dart';
import 'package:dujo_website/view/constants/const.dart';
import 'package:dujo_website/view/pages/Login/Admin/faculty/faculty_sec_screen.dart';
import 'package:dujo_website/view/pages/Login/Admin/live_section/live_sec_screen.dart';
import 'package:dujo_website/view/pages/Login/Admin/recorded_section/rec_sec_screen/recorded_sec_screen.dart';
import 'package:dujo_website/view/pages/widgets/button_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreen();
}

class _AdminPanelScreen extends State<AdminPanelScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('AdminPannel'),),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.019,
                    left: screenSize.width * 0.01),
                child: ButtonContainerWidget(
                  colorindex: 1,
                  curving: 30,
                  width: screenSize.width * 0.2,
                  height: screenSize.height * 0.93,
                  // ignore: prefer_const_constructors
                  child: Center(),
                ),
              ),
              SizedBox(width: screenSize.width * 0.015),
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.042),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: SizedBox(
                            height: screenSize.height * 0.3,
                            width: screenSize.width * 0.18,
                            child: Column(
                              children: [
                                ButtonContainerWidget(
                                  colorindex: 1,
                                  curving: 30,
                                  height: screenSize.height * 0.265,
                                  width: screenSize.width * 0.18,
                                  child: Center(
                                      child: LottieBuilder.network(
                                    'https://assets8.lottiefiles.com/packages/lf20_qm8eqzse.json',
                                  )),
                                ),
                                sizedBoxH10,
                                Text("Recorded Courses",
                                    style: GoogleFonts.montserrat(
                                      fontSize: screenSize.height * 0.019,
                                      fontWeight: FontWeight.bold,
                                      color: cBlack,
                                    )),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RecordedSectionScreen()),
                            );
                          },
                        ),
                        SizedBox(width: screenSize.width * 0.015),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LiveSectionScreen()),
                            );
                          },
                          child: SizedBox(
                            height: screenSize.height * 0.3,
                            width: screenSize.width * 0.18,
                            child: Column(
                              children: [
                                ButtonContainerWidget(
                                    colorindex: 1,
                                    curving: 30,
                                    height: screenSize.height * 0.265,
                                    width: screenSize.width * 0.18,
                                    child: Center(
                                      child: LottieBuilder.network(
                                          'https://assets8.lottiefiles.com/packages/lf20_8cgostj5.json'),
                                    )),
                                sizedBoxH10,
                                Text(
                                  "Live Courses",
                                  style: GoogleFonts.montserrat(
                                    fontSize: screenSize.height * 0.019,
                                    fontWeight: FontWeight.bold,
                                    color: cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.015),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: screenSize.height * 0.300,
                            width: screenSize.width * 0.18,
                            child: Column(
                              children: [
                                ButtonContainerWidget(
                                  colorindex: 1,
                                  curving: 30,
                                  height: screenSize.height * 0.265,
                                  width: screenSize.width * 0.18,
                                  child: LottieBuilder.network(
                                      'https://assets2.lottiefiles.com/packages/lf20_xyadoh9h.json'),
                                ),
                                sizedBoxH10,
                                Text(
                                  "Application Users",
                                  style: GoogleFonts.montserrat(
                                    fontSize: screenSize.height * 0.019,
                                    fontWeight: FontWeight.bold,
                                    color: cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.015),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: screenSize.height * 0.300,
                            width: screenSize.width * 0.18,
                            child: Column(
                              children: [
                                ButtonContainerWidget(
                                    colorindex: 1,
                                    curving: 30,
                                    height: screenSize.height * 0.265,
                                    width: screenSize.width * 0.18,
                                    child: Center(
                                      child: LottieBuilder.network(
                                          'https://assets9.lottiefiles.com/private_files/lf30_y2ryub2r.json'),
                                    )),
                                sizedBoxH10,
                                Text(
                                  "Study Materials",
                                  style: GoogleFonts.montserrat(
                                    fontSize: screenSize.height * 0.019,
                                    fontWeight: FontWeight.bold,
                                    color: cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: screenSize.height * 0.300,
                            width: screenSize.width * 0.18,
                            child: Column(
                              children: [
                                ButtonContainerWidget(
                                    colorindex: 1,
                                    curving: 30,
                                    height: screenSize.height * 0.265,
                                    width: screenSize.width * 0.18,
                                    child: Center(
                                      child: LottieBuilder.network(
                                          'https://assets10.lottiefiles.com/packages/lf20_uavyvaxw.json'),
                                    )),
                                sizedBoxH10,
                                Text(
                                  "Mock Tests",
                                  style: GoogleFonts.montserrat(
                                    fontSize: screenSize.height * 0.019,
                                    fontWeight: FontWeight.bold,
                                    color: cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.015),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FacultySectionScreen()),
                            );
                          },
                          child: SizedBox(
                            height: screenSize.height * 0.300,
                            width: screenSize.width * 0.18,
                            child: Column(
                              children: [
                                ButtonContainerWidget(
                                    colorindex: 1,
                                    curving: 30,
                                    height: screenSize.height * 0.265,
                                    width: screenSize.width * 0.18,
                                    child: Center(
                                      child: LottieBuilder.network(
                                          'https://assets5.lottiefiles.com/private_files/lf30_edmvwyn8.json'),
                                    )),
                                sizedBoxH10,
                                Text(
                                  "Faculties",
                                  style: GoogleFonts.montserrat(
                                    fontSize: screenSize.height * 0.019,
                                    fontWeight: FontWeight.bold,
                                    color: cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.015),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: screenSize.height * 0.300,
                            width: screenSize.width * 0.18,
                            child: Column(
                              children: [
                                ButtonContainerWidget(
                                    colorindex: 1,
                                    curving: 30,
                                    height: screenSize.height * 0.265,
                                    width: screenSize.width * 0.18,
                                    child: Center(
                                      child: LottieBuilder.network(
                                          'https://assets1.lottiefiles.com/private_files/lf30_58e9sh.json'),
                                    )),
                                sizedBoxH10,
                                Text(
                                  "Notifications",
                                  style: GoogleFonts.montserrat(
                                    fontSize: screenSize.height * 0.019,
                                    fontWeight: FontWeight.bold,
                                    color: cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.015),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: screenSize.height * 0.300,
                            width: screenSize.width * 0.18,
                            child: Column(
                              children: [
                                ButtonContainerWidget(
                                    colorindex: 1,
                                    curving: 30,
                                    height: screenSize.height * 0.265,
                                    width: screenSize.width * 0.18,
                                    child: Center(
                                      child: LottieBuilder.network(
                                          'https://assets3.lottiefiles.com/packages/lf20_yogqMMhCr0.json'),
                                    )),
                                sizedBoxH10,
                                Text(
                                  "Events",
                                  style: GoogleFonts.montserrat(
                                    fontSize: screenSize.height * 0.019,
                                    fontWeight: FontWeight.bold,
                                    color: cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Padding(
                      padding: EdgeInsets.only(right: screenSize.width * 0.58),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: screenSize.height * 0.300,
                              width: screenSize.width * 0.18,
                              child: Column(
                                children: [
                                  ButtonContainerWidget(
                                      colorindex: 1,
                                      curving: 30,
                                      height: screenSize.height * 0.265,
                                      width: screenSize.width * 0.18,
                                      child: Center(
                                        child: LottieBuilder.network(
                                            'https://assets2.lottiefiles.com/packages/lf20_une35akn.json'),
                                      )),
                                  sizedBoxH10,
                                  Text(
                                    "Ads",
                                    style: GoogleFonts.montserrat(
                                      fontSize: screenSize.height * 0.019,
                                      fontWeight: FontWeight.bold,
                                      color: cBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
