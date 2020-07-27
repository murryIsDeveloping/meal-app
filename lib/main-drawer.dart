import 'package:flutter/material.dart';
import './screen/tab_screen/tab_screen.dart';
import './screen/filter_screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  final Function filter;

  MainDrawer(this.filter);

  Widget _buildListTile({String title, IconData icon, Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Roboto Condensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile(
              icon: Icons.restaurant,
              title: "Meals",
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(TabScreen.screenName);
              }),
          _buildListTile(
              icon: Icons.settings,
              title: "Filters",
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FilterScreen.screenName)
                    .then((_) => filter());
              }),
        ],
      ),
    );
  }
}
