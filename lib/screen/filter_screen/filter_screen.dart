import 'package:flutter/material.dart';
import 'package:meals_app/main-drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenName = "/filter";
  final Function setFilters;
  final Map<String, bool> filters;

  FilterScreen({this.setFilters, this.filters});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget _buildSwitchListTile({
    String title,
    String description,
    String prop,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: widget.filters[prop],
      subtitle: Text(
        description,
      ),
      onChanged: (value) {
        setState(() {
          widget.filters[prop] = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.save),
        //     onPressed: () => {widget.setFilters()},
        //   )
        // ],
      ),
      drawer: MainDrawer(widget.setFilters),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                title: "Gluten Free",
                description: 'Only include gluten free meals.',
                prop: "gluten",
              ),
              _buildSwitchListTile(
                  title: "Lactose Free",
                  description: 'Only include Lactose free meals.',
                  prop: "lactose"),
              _buildSwitchListTile(
                  title: "Vegeterian",
                  description: 'Only include Vegeterian meals.',
                  prop: "vegetarian"),
              _buildSwitchListTile(
                title: "Vegan",
                description: 'Only include Vegan meals.',
                prop: "vegan",
              ),
            ],
          ))
        ],
      ),
    );
  }
}
