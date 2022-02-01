import 'package:flutter/material.dart';
import '../dummy_data.dart';

class mealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height/3,
        width: double.infinity,
        child: Image.network(selectedMeal.imageURL,fit: BoxFit.cover,),
      ),
    );
  }
}
