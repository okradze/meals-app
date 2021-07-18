import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.title} Recipes'),
      ),
      body: Center(
        child: Text('Category Meals'),
      ),
    );
  }
}
