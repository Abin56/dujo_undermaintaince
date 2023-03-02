import 'package:dujo_website/model/pTA_section/pta_category_model.dart';
import 'package:dujo_website/view/pages/Login/Admin/pTA_section/dropDownListofPTA_section.dart';
import 'package:flutter/material.dart';

import '../../../../../model/pTA_section/add_PTAMemberModel.dart';

class AddPtaMembersScreen extends StatelessWidget {
  var id;

  AddPtaMembersScreen({this.id, super.key});

  TextEditingController ptaMemberNameController = TextEditingController();

  TextEditingController ptaMemberIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('Add PTA Members')),
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
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: ptaMemberNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Name ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: ptaMemberIDController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Member ID',
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: PTASectionDropDownButton(schooilID: id,)),
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
                      final ptaMemberDetails = AddPTAMemberModel(
                          id: ptaMemberIDController.text.trim(),
                          ptaCategory: pTAPowerDownValue!["id"],
                          active: false,
                          PtaMemberID: ptaMemberIDController.text.trim(),
                          userName: ptaMemberNameController.text.trim(),
                          joinDate: DateTime.now().toString());
                      await PTAMembersAddToFireBase().pTAMembersAddController(
                          ptaMemberDetails, context, id);
                    },
                    child: const Text("Add Category"),
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
