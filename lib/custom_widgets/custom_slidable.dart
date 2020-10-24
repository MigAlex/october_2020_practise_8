import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction {
  archive,
  share,
  more,
  delete,
}

class CustomSlidable<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const CustomSlidable(
      {Key key, @required this.onDismissed, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: child,
      actions: [
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => onDismissed(SlidableAction.archive),
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.purple,
          icon: Icons.share,
          onTap: () => onDismissed(SlidableAction.share),
        )
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'More',
          color: Colors.black54,
          icon: Icons.more_horiz_rounded,
          onTap: () => onDismissed(SlidableAction.more),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red[800],
          icon: Icons.delete,
          onTap: () => onDismissed(SlidableAction.delete),
        )
      ],
    );
  }
}
