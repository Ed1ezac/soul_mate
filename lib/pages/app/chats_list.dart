import 'package:Soulmate_App/widgets/chat_list_row.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatefulWidget {
  @override
  _ChatsListState createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return ChatListRow(
            name: "Kealeboga",
            message: "",
            time: "",
          );
        } else if (index == 1) {
          return Column(
            children: <Widget>[
              Divider(
                indent: MediaQuery.of(context).size.height * 0.1,
              ),
              ChatListRow(
                name: "Randy",
                message: "",
                time: "",
                isOutgoing: false,
                isRead: false,
                isNewMatch: false,
              ),
            ],
          );
        } else {
          return Column(
            children: <Widget>[
              Divider(
                indent: MediaQuery.of(context).size.height * 0.1,
              ),
              ChatListRow(
                message: "",
                time: "",
                name: "Mathew",
                isRead: true,
              ),
            ],
          );
        }
      },
    );
  }
}
