import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screen/categories_meals_screen/widgets/meal-item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const screenName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = args["title"];
    final categoryId = args["id"];
    final meals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle Recipes"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          itemBuilder: (BuildContext cxt, int index) => MealItem(
            id: meals[index].id,
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            complexity: meals[index].complexity,
            duration: meals[index].duration,
            affordability: meals[index].affordability,
          ),
          itemCount: meals.length,
        ),
      ),
    );
  }
}
