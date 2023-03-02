import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/custom_button.dart';

class Bills extends StatefulWidget {
  const Bills({super.key});

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('bills'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(width: 2, color: Colors.white)),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //decoration:

                    child: Text(
                      "BILLS",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
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
                          text: "Create Bills",
                          onTap: () {},
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
                            text: 'Edit Bills',
                            onTap: () {},
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
                        text: 'Remove Bills',
                        onTap: () {},
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
    );
  }
}
