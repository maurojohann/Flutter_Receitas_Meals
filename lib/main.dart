import 'package:flutter/material.dart';
import 'package:receitas/screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';
import './utils/app_routers.dart';
import 'models/settings.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isfavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          primaryColor: Colors.amber[800],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      //home: CategoriesScreen(),
      routes: {
        AppRouters.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRouters.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRouters.MEAL_DETAILS: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isfavorite),
        AppRouters.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => CategoriesScreen());
      // },
    );
  }
}
