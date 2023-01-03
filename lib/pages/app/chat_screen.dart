import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:Soulmate_App/widgets/chat_message.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: chatAppBar(context)),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: ChatMessage(
                      message: "",
                      time: "",
                    ),
                  );
                } else {
                  return Align(
                    alignment: Alignment.topRight,
                    child: ChatMessage(
                      message: "",
                      time: "",
                      isOutgoing: true,
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenAwareSizeH(8.0, context),
              vertical: screenAwareSizeV(8.0, context),
            ),
            height: 56.0,
            color: Colors.brown,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.face),
                  onPressed: () {},
                ),
                Flexible(
                  child: Container(
                    child: TextField(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => {},
                  color: AppColors.soulAccentLight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget chatAppBar(BuildContext context) {
    return AppBar(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.orange,
            radius: 16.0,
            child: Container(
              child: Text("K"),
            ),
          ),
        ],
      ),
      title: Text("Kesa"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }
}
