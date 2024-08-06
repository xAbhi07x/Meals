import 'package:flutter/material.dart';
import 'package:meals/Widgets/category_grid_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavourite, required this.availableMeals});

  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;
  //flutter actually pushes and pops the screen on the screenstack.
  //context is not available globally in the stateless widget
  void _selectCategory(BuildContext context, Category category) {
    //where method is used to fliter the dummy meals list
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList(); 
    //where returns a new iterable that only contains the list which matches certain conditions

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals, onToggleFavourite: onToggleFavourite,),
      ),
    );
    //will push the route in front of the stack of the screen
    //MaterialPageRoute gives us such a route that we can put on the stack
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20, //spacing between the col
            mainAxisSpacing:
                20 //spacing between horizontally and vert between items
            ), // horizontally two coloumns next to each other
        children: [
          //alternative to availableCategories.map((category) => CatgoriesGridItem(category: category))
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      );
  }
}
