import 'package:dujo_website/model/create_classModel/create_classModel.dart';
import 'package:dujo_website/model/drop_DownList/get_classList.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_blue_button.dart';
import 'package:flutter/material.dart';

class AddClasses extends StatefulWidget {
var id;
   AddClasses({required this.id, super.key});

  @override
  State<AddClasses> createState() => _AddClassesState();
}

class _AddClassesState extends State<AddClasses> {
  TextEditingController classNameController = TextEditingController();
  TextEditingController classIDController = TextEditingController();
  TextEditingController classInChargeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: Text('LASSES')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.width * 1 / 9),
          child: Center(
            child: Container(
              color: Colors.white,
              height: screenSize.width * 1 / 4,
              width: screenSize.width * 1 / 4,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: classNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Class Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: classIDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Class ID',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: GetClassInchargeListDropDownButton(schoolID:widget.id, )
                ),
                SizedBox(
                  height: screenSize.width * 1 / 25,
                  width: screenSize.width * 1 / 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 39, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      print('adf');
                      final classDetails = AddClassesModel(
                          id: classIDController.text.trim(),
                          className: classNameController.text.trim(),
                          classID: classIDController.text.trim(),
                          classIncharge: classesInchargeListValue!["id"],
                          joinDate: DateTime.now().toString());
                          CreateClassesAddToFireBase().createClassesController(classDetails, context,widget.id,classIDController.text.trim());
                    },
                    child: const Text("Add Class"),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
