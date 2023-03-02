import 'package:dujo_website/view/pages/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class StudyMaterialTea extends StatefulWidget {
  const StudyMaterialTea({super.key});

  @override
  State<StudyMaterialTea> createState() => _StudyMaterialTeaState();
}

class _StudyMaterialTeaState extends State<StudyMaterialTea> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Study Materials'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenSize.width * 1 / 3, top: screenSize.width * 1 / 20),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AdminTeacherList(),
                    //     ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Upload',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AdminTeacherList(),
                    //     ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Edit',
                        onTap: () {},
                      )),
                ))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: (InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AdminTeacherList(),
                    //     ));
                  },
                  child: Container(
                      height: screenSize.width * 1 / 10,
                      width: screenSize.width * 1 / 3,
                      child: CustomContainer(
                        text: 'Remove',
                        onTap: () {},
                      )),
                ))),
          ],
        ),
      ),
    );
  }
}
