import 'package:flutter/material.dart';

class ExamsAndResult extends StatefulWidget {
  const ExamsAndResult({super.key});

  @override
  State<ExamsAndResult> createState() => _ExamsAndResultState();
}

class _ExamsAndResultState extends State<ExamsAndResult> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams And Results'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                    width: screenSize.width * 1 / 2,
                    height: screenSize.width * 1 / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF26A69A),
                            Color.fromARGB(255, 24, 34, 33),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: Column(children: [
                      Container(
                        height: screenSize.width * 1 / 15,
                        width: screenSize.width * 1 / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF26A69A),
                                Color.fromARGB(255, 9, 49, 45),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(5.0),
                            textStyle: const TextStyle(fontSize: 30),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => FeesUpdates()),
                            // );
                          },
                          child: const Text('Exams'),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ])),
              ),
              SizedBox(
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                    width: screenSize.width * 1 / 2,
                    height: screenSize.width * 1 / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF26A69A),
                            Color.fromARGB(255, 9, 49, 45),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: Column(children: [
                      Container(
                        height: screenSize.width * 1 / 15,
                        width: screenSize.width * 1 / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF26A69A),
                                Color.fromARGB(255, 9, 49, 45),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(5.0),
                            textStyle: const TextStyle(fontSize: 30),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Bills()),
                            // );
                          },
                          child: const Text('Publish Result'),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
