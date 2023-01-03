import 'package:Soulmate_App/pages/app/chat_screen.dart';
import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class ChatListRow extends StatelessWidget {
  final String name, message, time;
  final bool isOutgoing, isRead, isNewMatch;

  ChatListRow(
      {required this.name,
      required this.message,
      required this.time,
      this.isRead = false,
      this.isOutgoing = true,
      this.isNewMatch = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () => openChat(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              contentPadding:
                  EdgeInsets.only(left: screenAwareSizeH(8.0, context)),
              leading: CircleAvatar(
                radius: 28.0,
                child: Container(
                  child: Text(name.substring(0, 1)),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text("hey, do you wanna hang out?"),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "19:22",
                    style: TextStyle(fontSize: 11.0),
                  ),
                  isOutgoing
                      ? Visibility(
                          visible: isOutgoing,
                          child: isRead
                              ? Icon(
                                  Icons.done_all,
                                  size: 20,
                                  color: AppColors.soulPrimary,
                                )
                              : Icon(
                                  Icons.done,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                        )
                      : Visibility(
                          //inComing Text
                          visible: !isOutgoing,
                          child: isRead
                              ? Icon(
                                  Icons.filter_vintage,
                                  size: 20,
                                  color: Colors.transparent,
                                )
                              : isNewMatch
                                  ? Icon(
                                      Icons.announcement,
                                      size: 20,
                                      color: AppColors.soulPrimary,
                                    )
                                  : Container(
                                      width: screenAwareSizeH(22.0, context),
                                      height: screenAwareSizeV(22.0, context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.soulPrimary,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "2",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(),
      ),
    );
  }
}
