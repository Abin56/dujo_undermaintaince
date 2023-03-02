import 'package:flutter/material.dart';

class CustomTeaContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomTeaContainer({Key? key, required this.text, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 68, 166, 38),
                Color.fromARGB(255, 9, 49, 26),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
