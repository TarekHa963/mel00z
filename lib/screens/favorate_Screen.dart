import '../widget/meal_item.dart';

import '../modules/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeal;

  FavoriteScreen( this.favoriteMeal) ;


  @override
  Widget build(BuildContext context) {

    if (favoriteMeal.isEmpty){
      return Center(
        child: Text("You Have No Favorites Yet - Start Adding Some !"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id: favoriteMeal[index].id,
            imageUrl : favoriteMeal[index].imageUrl,
            title: favoriteMeal[index].title,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
            );

        },
        itemCount: favoriteMeal.length,
      ) ;
    }

  }
}
