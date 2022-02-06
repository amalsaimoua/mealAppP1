import 'package:flutter/material.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class favoritesScreen extends StatelessWidget {
final List<Meal> favoritesMeal ;
  favoritesScreen(this.favoritesMeal);


  @override
  Widget build(BuildContext context) {

    if(favoritesMeal.isEmpty) {
      return const Center(
      child: Text('You have no favorites yet - start adding some!'),
    );}
    else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return mealItem(
            id: favoritesMeal[index].id,
            imageURl: favoritesMeal[index].imageURL,
            title: favoritesMeal[index].title,
            duration: favoritesMeal[index].duration,
            complexity: favoritesMeal[index].complexity,
            affordability: favoritesMeal[index].affordability,

          );
        },
        itemCount: favoritesMeal.length,
      );
    }
    

    
  }
}