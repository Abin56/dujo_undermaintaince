import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../colors/colors.dart';
import '../../../widgets/button_container_widget.dart';

class LiveSectionScreen extends StatelessWidget {
  const LiveSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF26A69A),
        title: const Text("Live Section"),
      ),
      body: SafeArea(
          child: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            livesectionscreentext.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 200),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return AllStudyMaterialForLIVEScreen(
                        //       id: data.id,
                        //       catData: data.courseTitle,
                        //     );
                        //   },
                        // ));
                      },
                      child: ButtonContainerWidget(
                        margin: EdgeInsets.only(
                            bottom: w / 10, left: w / 20, right: w / 20),
                        colorindex: 1,
                        curving: 30,
                        width: 0,
                        height: 0,
                        child: Center(
                          child: Text(
                            livesectionscreentext[index],
                            style: GoogleFonts.montserrat(
                                color: cWhite,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}

List<String> livesectionscreentext = [
  'Subscribed Students',
  'Live Courses',
  'Get Invoice',
  'Create New Live Courses',
];
