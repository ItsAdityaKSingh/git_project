import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/model/meal.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<String> favmeal = [];


final List<Meal> favMealList = dummyMeals.where((meal) => favmeal.contains(meal.id)).toList();

List<Meal> getFavoriteMeals(List<String> favmealIds) {
  return dummyMeals.where((meal) => favmealIds.contains(meal.id)).toList();
}