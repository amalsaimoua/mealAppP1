import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';

class mainDrawer extends StatelessWidget {
  const mainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(Function() onTap, String title, IconData icon) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            padding: const EdgeInsets.only(bottom: 75),
            alignment: Alignment.bottomCenter,
            height: 200,
            width: double.infinity,
            child: const Text(
              'Cooking Up',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          buildListTile(() {
            Navigator.of(context).pushReplacementNamed('/');
          }, 'Meal', Icons.restaurant),
          buildListTile(() {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }, 'Filters', Icons.settings),
        ],
      ),
    );
  }
}
