import '../widget/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';

  final Function saveFilters;
  final Map currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  initState() {
    isGlutenFree = widget.currentFilters['gluten'];
    isLactoseFree = widget.currentFilters['lactose'];
    isVegan = widget.currentFilters['vegan'];
    isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchList(String title, bool currentValue, String description,
      Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map selectedFilter = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                };
                widget.saveFilters(selectedFilter);
              }),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchList(
                "Gluten-Free",
                isGlutenFree,
                "Only Include Gluten-Free Meal",
                (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                },
              ),
              buildSwitchList(
                "Lactose-Free",
                isLactoseFree,
                "Only Include Lactose-Free Meal",
                (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                },
              ),
              buildSwitchList(
                "Vegetarian",
                isVegetarian,
                "Only Include Vegetarian Meal",
                (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                },
              ),
              buildSwitchList(
                "Vegan",
                isVegan,
                "Only Include Vegan Meal",
                (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
