import 'package:flutter/material.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class tabsScreen extends StatefulWidget {
  static const routeName = 'tabs_screen';
  final List<Meal> _favoritesMeal;
  tabsScreen(this._favoritesMeal);
  @override
  State<tabsScreen> createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {
  List<Map<String, Object?>> _pages=[];

//to store the index No. that comes from the on tap
//property in the botton navigation bar
  int _selectedPageIndex = 0;

  @override
  void initState() {
   _pages= [
      {
        'page': CategoriesScreen(),
        'title': 'Meal categories',
      },
      {
        'page': favoritesScreen(widget._favoritesMeal),
        'title': 'favorites',
      }
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
      drawer: const mainDrawer(),
    );
  }
}
