import 'package:flutter/material.dart';
import 'package:mealapp/Widget/CategoryItem.dart';
import 'package:mealapp/data/dummy_data.dart';

class Categoryscreen extends StatefulWidget {
  Categoryscreen({super.key});
  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2),
          children: availableCategories.map((item) {
            return Categoryitem(Data: item , );
          }).toList()),
    );
  }
}
