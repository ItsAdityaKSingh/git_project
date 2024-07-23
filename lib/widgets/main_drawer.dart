import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key,required this.onSelectScreen});


  final void Function(String) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.9)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
                ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.fastfood,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 18,),
                      Text(
                        "cokking up",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                  ],
                ),
            ),
        ListTile(
          title: Text(
            "Meals",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
            ),
          ),
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onTap: (){
            onSelectScreen("meals");
            

          },
        ),
        ListTile(
          title: Text(
            "Filters",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
            ),
          ),
          leading: Icon(
            Icons.filter,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onTap: (){
            onSelectScreen("filters");
          },
        ),
        ],
      ),


    );
  }
}