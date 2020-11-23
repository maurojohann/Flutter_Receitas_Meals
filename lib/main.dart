import 'package:flutter/material.dart';
import 'package:receitas/screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';
import './utils/app_routers.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        AppRouters.HOME: (ctx) => TabsScreen(),
        AppRouters.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRouters.MEAL_DETAILS: (ctx) => MealDetailScreen(),
        AppRouters.SETTINGS: (ctx) => SettingsScreen(),
      },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => CategoriesScreen());
      // },
    );
  }
}
