import 'package:flutter/material.dart';
import 'package:mealapp/data/manageFilter.dart';

class Filterscreen extends StatefulWidget {
  const Filterscreen({super.key});

  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  // var _isGlucoseFree = false;
  // var _isLactosefree = false;
  // var _isveg = false;
  // var _isVegan = false;
  // void setFilter(){
  //   setState(() {
  //     isGlucoseFree = _isGlucoseFree;
  //     isLactosefree = _isLactosefree;
  //     isveg = _isveg;
  //     isVegan = _isVegan;
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {
    print(isLactosefree);
    print(isGlucoseFree);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SwitchListTile(
              value: isGlucoseFree,
              title: const Text("Guleten-free"),
              subtitle: const Text("Only include gluten free meals."),
              onChanged: (ischeck) {
                setState(() {
                  isGlucoseFree = ischeck;
                });
                ;
              }),
          SwitchListTile(
              value: isLactosefree,
              title: const Text("Luctose-free"),
              subtitle: const Text("Only include luctose free meals."),
              onChanged: (ischeck) {
                setState(() {
                  isLactosefree = ischeck;
                });
                
              }),
          SwitchListTile(
              value: isveg,
              title: const Text("Vegetarian"),
              subtitle: const Text("Only include vegetarian meals."),
              onChanged: (ischeck) {
                setState(() {
                  isveg = ischeck;
                });
              }),
          SwitchListTile(
              value: isVegan,
              title: const Text("Vegan"),
              subtitle: const Text("Only include vegan  meals."),
              onChanged: (ischeck) {
                setState(() {
                  isVegan = ischeck;
                });
              })
        ],
      ),
    );
  }
}
