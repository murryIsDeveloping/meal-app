import 'package:flutter/material.dart';
import 'package:meals_app/main-drawer.dart';

class FilterScreen extends StatelessWidget {
  static const screenName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filter Screen'),
      ),
    );
  }
}
