import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SamplePage extends StatefulWidget {
  SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  bool popup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              popup = true;
            });
            
       
          },
          onDoubleTap: () {
            setState(() {
              
              popup = false;
            });
          },
          child: Container(
            height: 500,
            width: double.infinity,
            color: Colors.amber,
          child: popup==true?
          Stack(
              children: [
                Positioned(
                  top: 100,
                  bottom: 0,
                  right: 300,
                  left: 10,
                  child: Container(
                    height: 1000,
                    width: 500,
                    color: Colors.red,
                  ),
                )
              ],
            )
            :Container()
          ),
        ),
      ),
    );
  }

}
