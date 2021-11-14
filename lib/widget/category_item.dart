import '../screens/category_mael_screen.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

 final String id;
 final String title;
 final Color color;

 CategoryItem(this.id, this.title, this.color);

 void selectCategory(BuildContext ctx){
  Navigator.of(ctx).pushNamed(CategoryMealScreen.routName,
  arguments: {
    'id' : id,
    'title' : title,
      }
  );

 }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectCategory(context);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.blue,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: TextStyle(
            fontFamily: 'AnnieUseYourTeles',
            fontSize: 25,
            fontWeight: FontWeight.w800,
        )
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
          begin:Alignment.topLeft,
          end:Alignment.bottomRight ,
          colors : [
            color.withOpacity(0.3),
            color,
          ]),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
