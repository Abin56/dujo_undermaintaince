
import 'package:flutter/material.dart';


class JournyPageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  const JournyPageButton({
  Key? key,
    required this.text,
    required this.icon,
    required this.onPressed}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Row(
        children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius:  BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(0,4),
              )
            ]
          ),
          width: 100,
          height: 100,
          child:  Icon (icon, color: Colors.white, size:  50,),
        ),
          const SizedBox(height: 10),
          Text(text, style:  const TextStyle(color: Colors.grey,fontSize: 10),)
      ],),
    );
  }
}
