import '../screens/Filter_Screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title , IconData icon , Function tabHandler){
    return ListTile(
      leading: Icon(icon,size: 26,),
      title: Text(title,style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          fontFamily: 'AnnieUseYourTeles'
      ),),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color:Colors.blueAccent,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text("Cooking up !",style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,

            ),),
          ),
          SizedBox(height: 20),
          buildListTile("Meal", Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);}),
        ],
      ),
    );
  }
}
