import 'package:flutter/material.dart';
import 'package:mealapp/Screen/MealScreen.dart';
import 'package:mealapp/model/Category.dart';

class Categoryitem extends StatelessWidget {
  const Categoryitem({super.key, required this.Data});
  final Category Data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MealScreen(Data.id  )));
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Data.color.withOpacity(0.55),
                Data.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10)
            
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            Data.title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
