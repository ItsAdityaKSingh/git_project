import 'package:flutter/material.dart';
import 'package:mealapp/Screen/CategoryScreen.dart';
import 'package:mealapp/Screen/FavoriteScreen.dart';
import 'package:mealapp/Screen/filterScreen.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int _selecedIndex = 0;
  void _setPage(int index) {
    setState(() {
      _selecedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenPage = Categoryscreen();
    String title = "Category";
    if (_selecedIndex == 0) {
      setState(() {
        screenPage = Categoryscreen();
        title = "Category";
      });
    } else if (_selecedIndex == 1) {
      setState(() {
        screenPage = Favoritescreen();
        title = "Favourite";
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 160, 66, 3),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, icon: const Icon(Icons.close))
                        ],
                      ),
                      const Center(
                        child: Row(
                          children: [
                            Icon(Icons.restaurant),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cooking Up!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              ListTile(
                leading: const Icon(Icons.restaurant),
                title: const Text('Meals'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Filters'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Filterscreen()));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _setPage,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.category),
                label: 'Categories',
                backgroundColor:
                    _selecedIndex == 0 ? Colors.red : Colors.white),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: 'favorite',
                backgroundColor: _selecedIndex == 0 ? Colors.white : Colors.red)
          ],
        ),
        body: screenPage);
  }
}
