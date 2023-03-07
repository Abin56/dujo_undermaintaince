import 'package:dujo_website/view/pages/Login/Admin/admin_panel.dart';
import 'package:dujo_website/view/pages/Login/loginScreen.dart';
import 'package:dujo_website/view/pages/Login/schoolDrop_downlist/schoolDropDownList.dart';
import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  TextEditingController schoolIdController = TextEditingController();
  NavigationBarWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        //height: 130,
        child: Row(
          children: [
            const SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const AdminPanelScreen();
                  },
                ));
              },
              child: const Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.6,
            ),
            InkWell(
              hoverColor: const Color(0xFF26A69A),
              onTap: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Enter Your School ID'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[GetSchoolListDropDownButton()],
                          // children: [
                          //   // TextFormField(
                          //   //   controller:schoolIdController,
                          //   // )
                          // ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('ok'),
                          onPressed: () async {
                            await Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen(
                                  schoolID: schoolListValue!["id"],
                                );
                              },
                            ));
                          },
                        ),
                        TextButton(
                          child: const Text('cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const SizedBox(
                height: 30,
                width: 75,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                width: screenSize.width * 1 / 15,
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: screenSize.width * 1 / 55,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/frdd.png",
                    height: screenSize.width * 1 / 75,
                    width: screenSize.width * 1 / 60,
                  ),
                ),
              ),
              // SizedBox(
              //   width: screenSize.width * 1 / 60,
              // ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: screenSize.width * 1 / 60,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/instag.png",
                    height: screenSize.width * 1 / 50,
                    width: screenSize.width * 1 / 50,
                  ),
                ),
              ),
              // SizedBox(
              //   width: screenSize.width * 1 / 60,
              // ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: screenSize.width * 1 / 60,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/twitt.png",
                    height: screenSize.width * 1 / 65,
                    width: screenSize.width * 1 / 65,
                  ),
                ),
              ),
              // SizedBox(
              //   width: screenSize.width * 1 / 70,
              // ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: screenSize.width * 1 / 60,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/utube.png",
                    height: screenSize.width * 1 / 62,
                    width: screenSize.width * 1 / 62,
                  ),
                ),
              ),
            ]),
          ],
        ));
  }
}
