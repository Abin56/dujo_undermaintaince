import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/custom_button.dart';

class FeesUpdates extends StatefulWidget {
  const FeesUpdates({super.key});

  @override
  State<FeesUpdates> createState() => _FeesUpdatesState();
}

class _FeesUpdatesState extends State<FeesUpdates> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         ,
                        //   ),
                        // );
                      },
                      child: Container(
                          height: screenSize.width * 1 / 10,
                          width: screenSize.width * 1 / 3.7,
                          child: CustomButton(
                            text: "Create Invoices",
          
                          )
                          // color: Colors.red,
                          ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: screenSize.width * 1 / 10,
                        width: screenSize.width * 1 / 3.7,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                            //        Meeting,
                            //   ),
                            // );
                          },
                          child: Container(
                            height: screenSize.width * 1 / 10,
                            width: screenSize.width * 1 / 3.7,
                            child: CustomButton(
                              text: 'Edit Invoices',
        
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         NoticeUpdates(),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: screenSize.width * 1 / 10,
                        width: screenSize.width * 1 / 3.7,
                        child: CustomButton(
                          text: 'Remove Invoices',
       
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
