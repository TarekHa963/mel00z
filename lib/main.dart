import './modules/meal.dart';
import './screens/Filter_Screen.dart';
import './screens/Tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen1.dart';
import './screens/category_mael_screen.dart';
import 'package:flutter/material.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];

  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        ;
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        ;
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        ;
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        ;
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeal.any((meal) => meal.id == id);
  }

  Color b1 = Color.fromARGB(255, 8, 77, 113);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.blueAccent,
          canvasColor: b1,
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(
                    fontFamily: 'AnnieUseYourTeles',
                    fontWeight: FontWeight.w800),
              )),

      // home: MyHomePage(),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(favoriteMeal),
        CategoryMealScreen.routName: (context) =>
            CategoryMealScreen(availableMeal),
        MealDetailScreen.routName: (context) =>
            MealDetailScreen(toggleFavorite, isMealFavorite),
        FiltersScreen.routName: (context) => FiltersScreen(filters, setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "تطبيق الوجبات",
            style: TextStyle(
              fontFamily: 'Dima Font',
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: CategoriesScreen(),
    );
  }
}
