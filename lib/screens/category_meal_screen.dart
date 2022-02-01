// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:mealapp/widgets/meal_item.dart';
import '../dummy_data.dart';

class categoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  _categoryMealScreenState createState() => _categoryMealScreenState();
}

class _categoryMealScreenState extends State<categoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routeArg['id'];
    final catTitle = routeArg['title'];
    //عملنا فلترة لل Dummy meals
    final catMeal = DUMMY_MEALS.where((meal) {
      // المتغير هنا يمر على كل عناصر الوجبات ويرى هل الآي دي
      // يطابق الآيدي الموجود معنا ف يعمله ارجاع return
      return meal.categories.contains(catId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
      
        title: Text('$catTitle'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return mealItem(
            id: catMeal[index].id,
            imageURl: catMeal[index].imageURL,
            title: catMeal[index].title,
            duration: catMeal[index].duration,
            complexity: catMeal[index].complexity,
            affordability: catMeal[index].affordability,
          );
        },
        itemCount: catMeal.length,
      ),
    );
  }
}
