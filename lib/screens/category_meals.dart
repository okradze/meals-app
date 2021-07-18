import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;

  const CategoryMealsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
