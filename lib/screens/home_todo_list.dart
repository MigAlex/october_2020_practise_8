import 'package:flutter/material.dart';
import 'package:october_2020_practise_8/custom_widgets/custom_exporter.dart';
import 'package:october_2020_practise_8/model/shopping_item.dart';
import 'package:october_2020_practise_8/utils/data_for_shopping_item.dart';
import 'dart:math';

class HomeToDoList extends StatefulWidget {
  @override
  _HomeToDoListState createState() => _HomeToDoListState();
}

class _HomeToDoListState extends State<HomeToDoList> {
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(DataForShoppingItem.shoppingList);
  final myRandom = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.purple[800],
      appBar: AppBar(title: Text('To Do List')),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: key,
              initialItemCount: items.length,
              itemBuilder: (context, index, animation) =>
                  buildItem(items[index], index, animation),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: buildInsertButton(),
          )
        ],
      ),
    );
  }

  buildItem(item, int index, Animation<double> animation) => CustomShoppingItem(
        item: item,
        animation: animation,
        onClicked: () => removeItem(index),
      );
  buildInsertButton() => RaisedButton(
        child: Text(
          'Insert item',
          style: TextStyle(fontSize: 20),
        ),
        color: Colors.white,
        onPressed: () => insertItem(myRandom.nextInt(5), DataForShoppingItem.shoppingList[myRandom.nextInt(5)]),
      );

  void insertItem(int index, ShoppingItem item) {
    items.insert(index, item);
    key.currentState.insertItem(index);
  }

  void removeItem(int index) {
    final item = items.removeAt(index);

    key.currentState.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
  }
}
