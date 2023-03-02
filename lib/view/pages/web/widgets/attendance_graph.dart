import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class AttendeanceGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Analytics"),
        ),
        body: MyScreen(),
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  final List<Feature> features = [
    Feature(
      title: "Students",
      color: Colors.blue,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
    Feature(
      title: "Teachers",
      color: Colors.pink,
      data: [1, 0.8, 0.6, 0.7, 0.3],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Text(
              "Attendeance",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          LineGraph(
            features: features,
            size: Size(250, 300),
            labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
            labelY: ['20%', '40%', '60%', '80%', '100%'],
            showDescription: true,
            graphColor: Colors.white30,
            graphOpacity: 0.2,
            verticalFeatureDirection: true,
            descriptionHeight: 80,
          ),
          // SizedBox(
          //  height: 50,
          //)
        ],
      ),
    );
  }
}
