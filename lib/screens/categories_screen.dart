// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/category_item.dart';

class CategororiesScreen extends StatelessWidget {
  const CategororiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Our Categories'),),
      body: GridView(
        padding: EdgeInsets.all(20),
          children: DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItem(catData.title,catData.color,catData.id),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          )),
    );
  }
}
