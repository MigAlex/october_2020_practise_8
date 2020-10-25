import 'package:flutter/material.dart';
import 'package:october_2020_practise_8/model/my_router.dart';
import 'screens/screen_exporter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouter.generateRoute,
      home: HomeMain(),
    );
  }
}