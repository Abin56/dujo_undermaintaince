import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [
              Color(0xFF26A69A),
              Color.fromARGB(255, 9, 49, 45),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: screenSize.width * 1 / 30,
                left: screenSize.width * 1 / 16),
            // child: Padding(
            //padding: EdgeInsets.only(right: screenSize.width * 1 / 30),
            child: Text(
              text,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
      // )
    );
  }
}
