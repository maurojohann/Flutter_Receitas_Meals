import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';
import './utils/app_routers.dart';

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
        AppRouters.HOME: (ctx) => CategoriesScreen(),
        AppRouters.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
//}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Vamos Cozinhar',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: CategoriesScreen(),
//       ),
//     );
//   }
// }
