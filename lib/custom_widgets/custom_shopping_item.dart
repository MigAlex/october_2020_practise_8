import 'package:flutter/material.dart';
import 'package:october_2020_practise_8/model/shopping_item.dart';

class CustomShoppingItem extends StatelessWidget {
  final ShoppingItem item;
  final Animation animation;
  final VoidCallback onClicked;

  const CustomShoppingItem({
    @required this.item,
    @required this.animation,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: animation,
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            leading: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(item.urlImage),
            ),
            title: Text(item.title, style: TextStyle(fontSize: 18)),
            trailing: IconButton(
              icon: Icon(Icons.check_circle, color: Colors.green, size: 32),
              onPressed: onClicked,
            ),
          ),
        ),
      );
}
