import 'package:dujo_website/view/pages/Login/Admin/admin_panel.dart';
import 'package:dujo_website/view/pages/Login/loginScreen.dart';
import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ));
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
