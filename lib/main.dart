import 'package:flutter/material.dart';
import 'package:october_2020_practise_8/home_dismissible.dart';
import 'package:october_2020_practise_8/home_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeSlidable(),
    );
  }
}