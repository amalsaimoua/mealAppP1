// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'FiltersScreen';
  final Function selctedFilters;
  FiltersScreen(this.selctedFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget buildSwitchTile(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return Column(
      children: [
        SwitchListTile(
          value: value,
          subtitle: Text(subtitle),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: onChanged,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegetarian,
              };

              widget.selctedFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust Your Filters Here :',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: Column(
            children: [
              buildSwitchTile(
                  'Gluten Free', 'Include only gluten-free meals.', _glutenFree,
                  (bool newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchTile(
                  'lactose Free',
                  'Include only lactose-free meals.',
                  _lactoseFree, (bool newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildSwitchTile('Vegan', 'Include only vegan meals.', _vegan,
                  (bool newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              buildSwitchTile(
                  'Vegetarian', 'Include onlyvegetarian meals.', _vegetarian,
                  (bool newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
            ],
          )),
        ],
      ),
      drawer: const mainDrawer(),
    );
  }
}
