import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
//import 'package:meals/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';



class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
 
    
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final activeFilters=ref.watch(filtersProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filter"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if (identifier=='meals'){
      //     Navigator.of(context).push(
      //     MaterialPageRoute(builder: (ctx)=>TabsScreen()),
      //     );
      //   } 
      // }),

      
      body:  Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
               ref.read(filtersProvider.notifier)
               .setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                "gluton-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include gluten-free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
             value: activeFilters[Filter.lactosFree]!,
              onChanged: (isChecked) {
               ref.read(filtersProvider.notifier)
               .setFilter(Filter.lactosFree, isChecked);
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include lactose-free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
               ref.read(filtersProvider.notifier)
               .setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include vegan meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegeterian]!,
              onChanged: (isChecked) {
               ref.read(filtersProvider.notifier)
               .setFilter(Filter.vegeterian, isChecked);
              },
              title: Text(
                "Vegeterian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include vegeterian meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            
        
          ],
        ),
      );
    
  }
}
