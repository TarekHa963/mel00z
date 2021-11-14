import '../modules/meal.dart';
import '../widget/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {

  static const routName = 'Category_Meals';

  final List<Meal> availableMeal ;

  CategoryMealScreen( this.availableMeal) ;

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle ;
  List<Meal> disPlayedMeal;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    disPlayedMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void removeMeal(String mealId){
    setState(() {
      disPlayedMeal.removeWhere((meal) => meal.id==mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        // Center(
        //   child: Text("وصفات الطعام   ",style: TextStyle(fontFamily: 'Dima Font',
        //       fontSize: 30,
        //       fontWeight:FontWeight.w800 )),
        // ),
      ),
      body: ListView.builder(
          itemBuilder: (ctx,index){
            return MealItem(
                id: disPlayedMeal[index].id,
                imageUrl : disPlayedMeal[index].imageUrl,
                title: disPlayedMeal[index].title,
                duration: disPlayedMeal[index].duration,
                complexity: disPlayedMeal[index].complexity,
                affordability: disPlayedMeal[index].affordability,
                );
                
           },
          itemCount: disPlayedMeal.length,
      ) ,
    );
  }
}
