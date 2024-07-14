import 'package:flutter/material.dart';
import 'package:mealapp/Screen/ItemDetails.dart';
import 'package:mealapp/Widget/mealTraits.dart';
import 'package:mealapp/model/meal.dart';


class Meallist extends StatelessWidget {
  const Meallist(this.item, {super.key});
  final List<Meal> item;
  String complexityText (int index){
    return item[index].complexity.name[0].toUpperCase() +
        item[index].complexity.name.substring(1);
  }

  String affordabilityText(int index) {
    return item[index].affordability.name[0].toUpperCase() +
        item[index].affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Itemdetails(item[index].id)));
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(200, 36, 36, 36)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              item[index].title,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MealItemTrait(
                                  icon: Icons.schedule,
                                  label: '${item[index].duration} min',
                                ),
                                const SizedBox(width: 12),
                                MealItemTrait(
                                  icon: Icons.work,
                                  label: complexityText(index),
                                ),
                                const SizedBox(width: 12),
                                MealItemTrait(
                                  icon: Icons.attach_money,
                                  label: affordabilityText(index),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: item.length);
  }
}
