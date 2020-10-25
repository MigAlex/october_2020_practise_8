

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:october_2020_practise_8/screens/screen_exporter.dart';

class MyRouter{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/home':
        return MaterialPageRoute(builder: (context) => HomeMain());
      case '/dismissible':
        return MaterialPageRoute(builder: (context) => HomeDismissible());
      case '/slidable':
        return MaterialPageRoute(builder: (context) => HomeSlidable());
      case '/toDoList':
        return MaterialPageRoute(builder: (context) => HomeToDoList());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  } 
}