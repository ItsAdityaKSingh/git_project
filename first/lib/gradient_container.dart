import 'package:first/Stylecolor.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
    Color.fromARGB(255, 245, 141, 5),
    Colors.white,
    Color.fromARGB(255, 26, 235, 33),
  ];
    return Scaffold(
      body: StyleColor(colors)
    );
  }
}
