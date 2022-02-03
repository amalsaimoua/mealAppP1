import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
 static const routeName = 'FiltersScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hi'),),
      body: null,
      drawer: mainDrawer(),
    );
  }
}