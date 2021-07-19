import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  void selectMeal(context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: meal,
    );
  }

  String get complexityText {
    return describeEnum(meal.complexity);
  }

  String get affordabilityText {
    return describeEnum(meal.affordability);
  }

  Widget buildMealSpecification(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 6),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 250,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildMealSpecification(
                      Icons.schedule, '${meal.duration} min'),
                  buildMealSpecification(Icons.work, complexityText),
                  buildMealSpecification(Icons.attach_money, affordabilityText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
