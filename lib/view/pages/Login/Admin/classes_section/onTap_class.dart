import 'package:dujo_website/view/pages/Login/Admin/classes_section/edit_class_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OnTapClassDetailsScreen extends StatelessWidget {
  var id;
  String className;
  String classID;
  String classiNCharge;
  OnTapClassDetailsScreen(
      {required this.id,
      required this.className,
      required this.classID,
      required this.classiNCharge,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(0, 54, 6, 6),
                // Color.fromARGB(255, 20, 178, 218),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EditClassesDetailsScreen(
                        id: id,
                        className: className,
                        classID: classID,
                        classiNCharge: classiNCharge);
                  },
                ));
              },
              child: Center(child: Text('edit class')),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(0, 54, 6, 6),
                // Color.fromARGB(255, 20, 178, 218),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Center(child: Text('class details')),
            )
          ],
        ),
      )),
    );
  }
}
