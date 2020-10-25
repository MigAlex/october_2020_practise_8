import 'package:flutter/material.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: null, accountEmail: null),
            ListTile(
              title: Text('Dismissible'),
              trailing: Icon(Icons.gesture),
              onTap: () => Navigator.pushNamed(context, '/dismissible'),
            ),
            ListTile(
              title: Text('Slidable'),
              trailing: Icon(Icons.slideshow_sharp),
              onTap: () => Navigator.pushNamed(context, '/slidable'),
            ),
            ListTile(
              title: Text('To Do List'),
              trailing: Icon(Icons.list),
              onTap: () => Navigator.pushNamed(context, '/toDoList'),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
