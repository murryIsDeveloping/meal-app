import 'package:flutter/material.dart';

import './screen/tab_screen/tab_screen.dart';
import './screen/categories_meals_screen/categories_meals_screen.dart';
import './screen/categories_screen/categories_screen.dart';
import './screen/meal_screen/meal_screen.dart';

void main() {
  runApp(MyApp());
}

final bodyText = const TextStyle(color: Color.fromRGBO(20, 51, 51, 1));

class MyApp extends StatelessWidget {
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
          TabScreen.screenName: (_) => TabScreen(),
          CategoriesMealsScreen.screenName: (_) => CategoriesMealsScreen(),
          MealScreen.screenName: (_) => MealScreen(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (_) => CategoriesScreen(), settings: settings));
  }
}
