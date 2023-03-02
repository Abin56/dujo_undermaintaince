import 'package:dujo_website/model/pTA_section/pta_category_model.dart';
import 'package:flutter/material.dart';

class AddPTACategoryAcreen extends StatelessWidget {
  var id;


  AddPTACategoryAcreen(
      {
      this.id,
      super.key});

  TextEditingController ptaCategoryNameController = TextEditingController();

  TextEditingController ptaIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 88),
      appBar: AppBar(title: const Text('Add PTA Category')),
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
                    controller: ptaCategoryNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'PTA CategoryName',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: ptaIDController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'PTA ID  ',
                    ),
                  ),
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
                      final ptaCategoryDetails = AddPTACategoryModel(
                          id: ptaIDController.text.trim(),
                          ptaCategory: ptaCategoryNameController.text.trim(),
                          active: false,
                          PTAID: ptaIDController.text.trim(),
                          joinDate: DateTime.now().toString());
                      await PTACategoryAddToFireBase().pTACategoryAddController(
                          ptaCategoryDetails, context, id);
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
