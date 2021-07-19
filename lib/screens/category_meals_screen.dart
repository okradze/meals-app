import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    // Finds Meals that belong to current category
    final meals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.title} Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = meals[index];
          return MealItem(
            key: Key(meal.id),
            meal: meal,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
