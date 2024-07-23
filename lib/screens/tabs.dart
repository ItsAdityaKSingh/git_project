import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



const kinitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegan: false,
  Filter.vegeterian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  

  int _selectedPageIndex = 0;
  Map<Filter,bool> _selectedFilters=kinitialFilters;



  

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
       await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
            builder: (ctx) =>const FiltersScreen(),
            ),
      );
     
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals=ref.watch(filteredMealProvider);
   
   

    Widget activePage = CategoriesScreen(
     
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals=ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
       
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(
        onSelectScreen: setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorite'),
        ],
      ),
    );
  }
}
