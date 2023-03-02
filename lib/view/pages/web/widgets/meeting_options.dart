import 'package:flutter/material.dart';

class MeetingOptions extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOptions({Key? key,
    required this.text,
    required this.isMute,
    required this.onChange})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  60,
      color: Colors.red,
      child: Row(
        children: [
          Padding(padding: const EdgeInsets.all(10),
          child:Text(text, style: const TextStyle(fontSize: 16),)
          ),
          Switch.adaptive(value: isMute,
              onChanged: onChange)
        ],
      ),

    );
  }
}
