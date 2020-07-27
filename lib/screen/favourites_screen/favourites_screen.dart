import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screen/categories_meals_screen/widgets/meal-item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<String> favourites;

  FavouritesScreen({this.favourites});

  @override
  Widget build(BuildContext context) {
    var favs =
        DUMMY_MEALS.where((meal) => favourites.contains(meal.id)).toList();

    return favs.length == 0
        ? Center(child: Text('You have no favorites yet - start adding some!'))
        : ListView.builder(
            itemBuilder: (BuildContext cxt, int index) => MealItem(
              id: favs[index].id,
              title: favs[index].title,
              imageUrl: favs[index].imageUrl,
              complexity: favs[index].complexity,
              duration: favs[index].duration,
              affordability: favs[index].affordability,
            ),
            itemCount: favs.length,
          );
  }
}
