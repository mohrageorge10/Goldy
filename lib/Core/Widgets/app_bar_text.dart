import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({super.key, required this.txt, required this.color});
  final String txt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 26,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
