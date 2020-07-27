import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import './screen/filter_screen/filter_screen.dart';

import './screen/tab_screen/tab_screen.dart';
import './screen/categories_meals_screen/categories_meals_screen.dart';
import './screen/categories_screen/categories_screen.dart';
import './screen/meal_screen/meal_screen.dart';

void main() {
  runApp(MyApp());
}

final bodyText = const TextStyle(color: Color.fromRGBO(20, 51, 51, 1));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<String> _favourites = [];

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _toggleFav(String id) {
    var index = _favourites.indexOf(id);
    if (index >= 0) {
      setState(() {
        _favourites.removeAt(index);
      });
    } else {
      setState(() {
        _favourites.add(id);
      });
    }
  }

  void _setFilters() {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }

        if (_filters["vegan"] && !meal.isVegan) {
          return false;
        }

        if (_filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: bodyText,
                bodyText2: bodyText,
                headline6: TextStyle(
                  fontSize: 24,
                  fontFamily: "Roboto Condensed",
                  color: Colors.white,
                ),
                headline5: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto Condensed",
                ),
              ),
        ),
        initialRoute: CategoriesScreen.screenName,
        routes: {
          TabScreen.screenName: (_) =>
              TabScreen(setFilters: _setFilters, favourites: _favourites),
          CategoriesMealsScreen.screenName: (_) =>
              CategoriesMealsScreen(_availableMeals),
          MealScreen.screenName: (_) => MealScreen(_toggleFav, _favourites),
          FilterScreen.screenName: (_) =>
              FilterScreen(setFilters: _setFilters, filters: _filters),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (_) => CategoriesScreen(), settings: settings));
  }
}
