import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  final String s;

  const StyleText(this.s, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      s,
      style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),
    );
  }
}
