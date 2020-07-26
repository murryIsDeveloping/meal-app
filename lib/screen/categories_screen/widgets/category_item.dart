import 'package:flutter/material.dart';

import './../../../shared/widgets/colored-tile.dart';
import './../../categories_meals_screen/categories_meals_screen.dart';
import './../../../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return ColoredTile(
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      color: category.color,
      onTap: () => Navigator.of(context)
          .pushNamed(CategoriesMealsScreen.screenName, arguments: {
        "id": category.id,
        "title": category.title,
      }),
    );
  }
}
