// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class mealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';
  final Function toggleFavorite;
  final Function isMealFavorite;

  const mealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget textTitle(BuildContext context, String text) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        ));
  }

  Widget details(Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            textTitle(context, 'Ingredients'),
            details(
              ListView.builder(
                itemBuilder: (BuildContext context, index) => Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            textTitle(context, 'Steps'),
            details(
              ListView.builder(
                itemBuilder: (BuildContext context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => toggleFavorite(mealId),
        child: Icon(isMealFavorite(mealId) ? Icons.star: Icons.star_border),
      ),
    );
  }
}
