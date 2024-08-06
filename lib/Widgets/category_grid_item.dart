//Category item ko dikhana kaise he, that is handled by me

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key, 
    required this.category, 
    required this.onSelectCategory,
    });

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //GestureDetector is primarly used to make it tappable
      //but Inkwell add many other taps like double taps etc, and also you will get nice visual feedback if you tap the item
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor, //visual tapping effect
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        //using container because container gives us a lot of background decoration thing
        decoration: BoxDecoration(
            //using this because we can create a gradient from it
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),

        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
