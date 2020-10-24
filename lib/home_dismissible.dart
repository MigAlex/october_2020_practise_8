import 'package:flutter/material.dart';
import 'package:october_2020_practise_8/custom_widgets/custom_dismissible.dart';
import 'package:october_2020_practise_8/model/chat.dart';
import 'package:october_2020_practise_8/utils/data_for_chat.dart';

import 'utils/utils.dart';

class HomeDismissible extends StatefulWidget {
  @override
  _HomeDismissibleState createState() => _HomeDismissibleState();
}

class _HomeDismissibleState extends State<HomeDismissible> {
  List<Chat> items = List.of(DataForChat.chats);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.restore),
              onPressed: () {
                setState(() {
                  items = List.of(DataForChat.chats);
                });
              })
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final item = items[index];
            return CustomDismissible(
                item: item,
                onDismissed: (direction) =>
                    dismissItem(context, index, direction),
                child: buildListTile(item));
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: items.length),
    );
  }

  void dismissItem(
      BuildContext context, int index, DismissDirection direction) {
    setState(() {
      items.removeAt(index);
    });
    switch (direction) {
      case DismissDirection.endToStart:
        Utils.showSnackBar(context, 'Chat has been deleted');
        break;
      case DismissDirection.startToEnd:
        Utils.showSnackBar(context, 'Chat has been archived');
        break;
      default:
        break;
    }
  }

  Widget buildListTile(Chat item) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(item.urlAvatar),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(item.message)
          ],
        ),
        onTap: () {},
      );
}
