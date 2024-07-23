import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
enum Filter{
  glutenFree,
   lactosFree,
  vegeterian,
  vegan;
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
FiltersNotifier():super({
  Filter.glutenFree:false,
  Filter.lactosFree:false,
  Filter.vegeterian:false,
  Filter.vegan:false,
});

void setFilters(Map<Filter,bool> chosenFilters){
state=chosenFilters;
}
void setFilter(Filter filter,bool isActive){
  state={
    ...state,
    filter:isActive,

  };
}
}

final filtersProvider=StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>((ref) => FiltersNotifier(),
);


final filteredMealProvider=Provider((ref) {
  final meals=ref.watch(mealsProvider);
  final activeFilters=ref.watch(filtersProvider);
  return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree)
        return false;
      if (activeFilters[Filter.lactosFree]! && !meal.isLactoseFree)
        return false;
      
      if (activeFilters[Filter.vegeterian]! && !meal.isVegetarian)
        return false;
        if (activeFilters[Filter.vegan]! && !meal.isVegan) 
        return false;
      return true;
    }).toList();
});
