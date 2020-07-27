import 'package:flutter/material.dart';

import './../../models/meal.dart';
import './../../screen/categories_meals_screen/widgets/meal-item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const screenName = "/category-meals";
  final List<Meal> availableMeals;
  CategoriesMealsScreen(this.availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  List<String> removedMealIds = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = args["title"];
    final categoryId = args["id"];

    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle Recipes"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          itemBuilder: (BuildContext cxt, int index) => MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
          ),
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
