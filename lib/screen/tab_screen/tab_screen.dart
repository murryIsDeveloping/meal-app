import 'package:flutter/material.dart';
import './../../main-drawer.dart';
import './../../screen/categories_screen/categories_screen.dart';
import './../../screen/favourites_screen/favourites_screen.dart';

class TabScreen extends StatefulWidget {
  static const screenName = "/";
  final Function setFilters;
  final List<String> favourites;
  TabScreen({this.setFilters, this.favourites});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        "title": "Meal App",
        "widget": CategoriesScreen(),
      },
      {
        "title": "My Favourites",
        "widget": FavouritesScreen(favourites: widget.favourites),
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]["title"],
        ),
      ),
      drawer: MainDrawer(widget.setFilters),
      body: _pages[_selectedPageIndex]["widget"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourites"),
          )
        ],
      ),
    );
  }
}
