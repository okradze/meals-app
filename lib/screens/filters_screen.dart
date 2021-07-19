import 'package:flutter/material.dart';
import 'package:meals_app/models/filters.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  final Filters filters;
  final Function setFilters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal settings',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten Free'),
                  subtitle: Text('Only include gluten-free meals'),
                  value: filters.glutenFree,
                  onChanged: (val) {
                    filters.glutenFree = val;
                    setFilters(filters);
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  subtitle: Text('Only include lactose-free meals'),
                  value: filters.lactoseFree,
                  onChanged: (val) {
                    filters.lactoseFree = val;
                    setFilters(filters);
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('Only include vegan meals'),
                  value: filters.vegan,
                  onChanged: (val) {
                    filters.vegan = val;
                    setFilters(filters);
                  },
                ),
                SwitchListTile(
                  title: Text('Vegeratian'),
                  subtitle: Text('Only include vegetarian meals'),
                  value: filters.vegetarian,
                  onChanged: (val) {
                    filters.vegetarian = val;
                    setFilters(filters);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
