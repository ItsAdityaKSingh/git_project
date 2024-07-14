import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/data/manageFav.dart';
import 'package:mealapp/model/meal.dart';

class Itemdetails extends StatefulWidget {
  const Itemdetails(this.id, {super.key});
  final String id;
  @override
  State<Itemdetails> createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  _ItemdetailsState();

  @override
  Widget build(BuildContext context) {
    final List<Meal> meals = getMealById(widget.id);
    void manageFav() {
      setState(() {
        if (!favmeal.contains(meals[0].id)) {
          favmeal.add(meals[0].id);
        } else {
          favmeal.remove(meals[0].id);
        }
      });
    }

    print(favmeal);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meals[0].title,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                manageFav();
              },
              icon: Icon(
                Icons.star,
                color: favmeal.contains(meals[0].id)
                    ? Colors.yellow
                    : Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: NetworkImage(meals[0].imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              const Text(
                "Ingredients",
                style: TextStyle(
                    color: Color.fromARGB(255, 241, 161, 12), fontSize: 20),
              ),
              ...meals[0].ingredients.map((item) {
                return Text(
                  item,
                  style: const TextStyle(color: Colors.white),
                );
              })
            ]),
            const SizedBox(
              height: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text(
                "Steps",
                style: TextStyle(
                    color: Color.fromARGB(255, 241, 161, 12), fontSize: 20),
                textAlign: TextAlign.center,
              ),
              ...meals[0].steps.map((item) {
                return Text(
                  item,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                );
              })
            ]),
          ],
        ),
      ),
    );
  }
}
