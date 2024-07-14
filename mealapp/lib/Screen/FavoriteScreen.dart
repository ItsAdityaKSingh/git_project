import 'package:flutter/material.dart';
import 'package:mealapp/Widget/mealList.dart';
import 'package:mealapp/data/manageFav.dart';
import 'package:mealapp/model/meal.dart';

class Favoritescreen extends StatelessWidget {
  Favoritescreen({super.key});
  final List<Meal> favMealListt = getFavoriteMeals(favmeal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // title: Text(title),
            ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: favMealListt.isEmpty
                ? const Center(
                    child: Text("No Items" , style: TextStyle(color: Colors.white),),
                  )
                : Meallist(favMealList)));
  }
}
