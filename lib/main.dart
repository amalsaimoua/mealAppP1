// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/screens/filters_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _toggleFavorite(String mealId){
   final existingIndex= _favoriteMeal.indexWhere((meal) => meal.id==mealId);
   
   if (existingIndex >=0){
     _favoriteMeal.removeAt(existingIndex);
   } else {_favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));}
  }

  void saveFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['vegeterian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  bool isMealFavorite(String id) {
    //returns either true or false
    return  _favoriteMeal.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        // خلفية الشاشة الرئيسية
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        primaryColor: Colors.teal[100],
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            headline1: TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              //fontWeight: FontWeight.bold,
            )),
      ),
      // home: const CategororiesScreen(),
      routes: {
        '/': (context) => tabsScreen(_favoriteMeal),
        categoryMealScreen.routeName: (context) =>
            categoryMealScreen(_availableMeal),
        mealDetailScreen.routeName: (context) =>
            mealDetailScreen(_toggleFavorite, isMealFavorite),
        tabsScreen.routeName: (context) => tabsScreen(_favoriteMeal),
        FiltersScreen.routeName: (context) => FiltersScreen(saveFilters,_filters),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Meal App'),
//       ),
//       body: null,
//     );
//   }
// }
