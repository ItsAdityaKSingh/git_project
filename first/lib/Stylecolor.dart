import 'package:first/Image_conatiner.dart';
import 'package:flutter/material.dart';

class StyleColor extends StatelessWidget {
  final List<Color> colors ;
  StyleColor(this.colors, {super.key});
  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: colors,
              transform: GradientRotation(45)),
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Center(
          child: ImageConatiner()
        ),
      ),
    );
  }
}
