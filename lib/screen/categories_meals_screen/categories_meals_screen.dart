import 'package:flutter/material.dart';

import './../../data/dummy_data.dart';
import './../../models/meal.dart';
import './../../screen/categories_meals_screen/widgets/meal-item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const screenName = "/category-meals";

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

    displayedMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  _removeItem(String id) {
    setState(() {
      removedMealIds.add(id);
      displayedMeals.removeWhere((val) => removedMealIds.contains(val.id));
    });
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
            removeItem: _removeItem,
          ),
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
