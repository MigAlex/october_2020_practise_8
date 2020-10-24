import 'package:flutter/material.dart';

class CustomDismissible<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismissed;

  const CustomDismissible(
      {Key key,
      @required this.item,
      @required this.onDismissed,
      @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(item),
      background: buildSwipeActionToLeft(),
      secondaryBackground: buildSwipeActionToRight(),
      child: child,
      onDismissed: onDismissed,
    );
  }

  Container buildSwipeActionToLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 18),
        color: Colors.green,
        child: Icon(Icons.archive_sharp, color: Colors.white, size: 28),
      );

  Container buildSwipeActionToRight() => Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 18),
        color: Colors.red,
        child: Icon(Icons.delete_forever, color: Colors.white, size: 28),
      );
}
