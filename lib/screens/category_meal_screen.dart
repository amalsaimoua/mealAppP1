// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';
import '../dummy_data.dart';

class categoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  _categoryMealScreenState createState() => _categoryMealScreenState();
}

class _categoryMealScreenState extends State<categoryMealScreen> {
   String? categorytitle;
   List<Meal> ?displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routeArg['id'];
   categorytitle = routeArg['title'];
    //عملنا فلترة لل Dummy meals
    displayedMeals = DUMMY_MEALS.where((meal) {
      // المتغير هنا يمر على كل عناصر الوجبات ويرى هل الآي دي
      // يطابق الآيدي الموجود معنا ف يعمله ارجاع return
      return meal.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealid) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return mealItem(
            id: displayedMeals![index].id,
            imageURl: displayedMeals![index].imageURL,
            title: displayedMeals![index].title,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
