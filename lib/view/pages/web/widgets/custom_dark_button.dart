import 'package:flutter/material.dart';

class CustomDarkButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomDarkButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(0, 54, 6, 6),
              // Color.fromARGB(255, 20, 178, 218),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: Center(child: Text(text)),
          ),
        ));
  }
}
