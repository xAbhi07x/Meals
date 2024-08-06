import 'package:flutter/material.dart';
import 'package:meals/Widgets/meal_item_trait.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityTest {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityTest {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover, // so that image is not distorted
              height: 200,
              width: double.infinity, // takes all space horizonatally
            ), //smoothly faded in popping of image //bottom of the stack

            Positioned(
              bottom: 0,
              left: 0, //start at left border
              right: 0, // end at the right border
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // very long text  ....
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            label: '${meal.duration} min',
                            icon: Icons.schedule),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            label: '$complexityTest min', icon: Icons.work
                        ),
                        MealItemTrait(
                            label: '$affordabilityTest min', icon: Icons.attach_money
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ), //can be used to positioned widgets on top of each other along z-axis
      ),
    );
  }
}
