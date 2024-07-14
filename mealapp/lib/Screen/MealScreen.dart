import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealapp/Widget/mealList.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/data/manageFilter.dart';
import '../model/meal.dart';

class MealScreen extends StatelessWidget {
  MealScreen(this.id);
  final String id;
  // final String title;

  @override
  Widget build(BuildContext context) {
    final List<Meal> item = getMealsByCategory(id);
    return Scaffold(
        appBar: AppBar(
          // title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Meallist(item.where((meal) {
              if (isGlucoseFree && !meal.isGlutenFree) return false;
              if (isLactosefree && !meal.isLactoseFree) return false;
              if (isveg && !meal.isVegetarian) return false;
              if (isVegan && !meal.isVegan) return false;
              return true;
            }).toList())));
  }
}
