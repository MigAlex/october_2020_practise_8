import 'package:flutter/material.dart';
import 'package:october_2020_practise_8/utils/data_for_chat.dart';
import 'package:october_2020_practise_8/model/chat.dart';

import 'custom_widgets/custom_slidable.dart';
import 'utils/utils.dart';

class HomeSlidable extends StatefulWidget {
  @override
  _HomeSlidableState createState() => _HomeSlidableState();
}

class _HomeSlidableState extends State<HomeSlidable> {
  List<Chat> items = List.of(DataForChat.chats);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomSlidable(
            child: buildListTile(item),
            onDismissed: (action) =>
                dismissSlideableItem(context, index, action),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: items.length,
      ),
    );
  }

  buildListTile(Chat item) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(item.urlAvatar),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.username,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(item.message)
        ],
      ),
      onTap: () {},
    );
  }

  dismissSlideableItem(BuildContext context, int index, SlidableAction action) {
    setState(() {
      items.removeAt(index);
    });

    switch (action) {
      case SlidableAction.archive:
        Utils.showSnackBar(context, 'Chat has been archived');
        break;
      case SlidableAction.share:
        Utils.showSnackBar(context, 'Chat has been shared');
        break;
      case SlidableAction.more:
        Utils.showSnackBar(context, 'Selected more options');
        break;
      case SlidableAction.delete:
        Utils.showSnackBar(context, 'Chat has been deleted');
        break;
    }
  }
}
