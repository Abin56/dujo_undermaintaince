
// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  Widget child;
  double bottom;
  double left;
  double right;
  double curving;
  int colorindex;

  GlassMorphism(
      {required this.bottom,
      required this.left,
      required this.right,
      required this.curving,
      required this.child,
      required this.colorindex,
      super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin:
          EdgeInsets.only(bottom: w / bottom, left: w / left, right: w / right),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: containerColor[colorindex].first.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
        gradient: LinearGradient(
            colors: containerColor[colorindex],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.all(
          Radius.circular(curving),
        ),
      ),
      child: child,
    );
  }
}

const containerColor = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color(0xFF26A69A), Color(0xFF26A69A)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(255, 205, 215, 15), Color.fromARGB(255, 224, 173, 22)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)],
  [
    Color.fromARGB(248, 54, 0, 79),
    Color.fromARGB(255, 58, 0, 84),
  ],
  [Color(0xFF26A69A), Color(0xFF26A69A)]
];
