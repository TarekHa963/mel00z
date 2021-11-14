import '../widget/category_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';


class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GridView(
        padding:EdgeInsets.all(25) , 
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, //max width
            childAspectRatio: 3/2,  //width to height
            crossAxisSpacing: 20,  //spaces between items in width
            mainAxisSpacing: 20,  //spaces between items in height
          ),
        children: DUMMY_CATEGORIES.map((cateDate) =>
          CategoryItem(cateDate.id, cateDate.title,cateDate.color),
        ).toList(),
      ),
    );
  }
}
