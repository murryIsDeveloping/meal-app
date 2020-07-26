import 'package:flutter/material.dart';

import './../../data/dummy_data.dart';
import './widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const screenName = "/";
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES.map((cat) => CategoryItem(cat)).toList(),
    );
  }
}
