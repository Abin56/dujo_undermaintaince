import 'package:flutter/material.dart';

class CustomNewContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomNewContainer({Key? key, required this.text, required this.onTap})
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
                Color.fromARGB(255, 32, 189, 142),
                Color.fromARGB(255, 10, 44, 12),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
