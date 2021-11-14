import '../modules/meal.dart';
import '../widget/main_drawer.dart';
import 'favorate_Screen.dart';
import 'package:flutter/material.dart';
import 'categories_screen1.dart';


class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeal;

   TabsScreen( this.favoriteMeal) ;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List pages;
  int selectedPageIndex = 0;


  @override
  void initState() {
    pages = [
      {
        'page' : CategoriesScreen(),
        'title': 'categories',
      },
      {
        'page' :  FavoriteScreen(widget.favoriteMeal),
        'title': 'Your Favorites'
      }
    ];
    super.initState();
  }



  void selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text("تطبيق الوجبات    ",
            style: TextStyle(
              fontFamily: 'Dima Font',
              fontSize: 30,
              fontWeight:FontWeight.w800,
            ),
          ),
        ),
      ),
      body: pages[selectedPageIndex]['page'] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.indigoAccent,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title:Text("Categories") ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title:Text("Favorites") ),
        ],
        
      ),
      drawer: MainDrawer(),
    );
  }


}
