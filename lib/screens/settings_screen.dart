import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _screateSwitch(
    String title,
    String subtitle,
    bool value,
    Function onChange,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title), value: value, onChanged: onChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Configurações',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
                child: ListView(
              children: [
                _screateSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem Glutén',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _screateSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem Lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _screateSwitch(
                  'Vegana',
                  'Só exibe refeições Veganas',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _screateSwitch(
                  'Vegetariana',
                  'Só exibe refeições Vegetariana',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ))
          ],
        ));
  }
}
