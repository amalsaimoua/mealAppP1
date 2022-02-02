import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (context) => const tabsScreen(),
        categoryMealScreen.routeName: (context) => categoryMealScreen(),
        mealDetailScreen.routeName: (context) => mealDetailScreen(),
        tabsScreen.routeName:(context) => const tabsScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
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
