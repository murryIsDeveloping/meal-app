import 'package:flutter/material.dart';
import './../../data/dummy_data.dart';

class MealScreen extends StatelessWidget {
  static const screenName = '/meal';

  List<Widget> buildSection(
      {BuildContext context,
      String title,
      List<String> list,
      Widget Function(String, int) childBuilder}) {
    return [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: Theme.of(context).textTheme.headline5),
      ),
      Container(
        height: 180,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (ctx, index) => childBuilder(list[index], index),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        meal.title,
        style: TextStyle(fontSize: 18),
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              ...buildSection(
                  context: context,
                  title: "Ingredients",
                  list: meal.ingredients,
                  childBuilder: (val, _) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(val),
                        ),
                      )),
              ...buildSection(
                context: context,
                title: "Steps",
                list: meal.steps,
                childBuilder: (val, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(val),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
