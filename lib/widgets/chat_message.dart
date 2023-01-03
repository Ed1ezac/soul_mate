import 'package:Soulmate_App/utils/widget_utils.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class ChatMessage extends StatefulWidget {
  final String message, time;
  final bool isOutgoing, isRead;

  const ChatMessage(
      {Key? key,
      required this.message,
      required this.time,
      this.isOutgoing = false,
      this.isRead = false})
      : super(key: key);

  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  final double _radius = 12.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenAwareSizeH(8.0, context),
        vertical: screenAwareSizeV(8.0, context),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenAwareSizeH(8.0, context),
        vertical: screenAwareSizeV(8.0, context),
      ),
      decoration: BoxDecoration(
        color:
            widget.isOutgoing ? AppColors.soulPrimaryLight : Colors.grey[400],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_radius),
          topRight: Radius.circular(_radius),
          bottomLeft:
              widget.isOutgoing ? Radius.circular(_radius) : Radius.zero,
          bottomRight:
              widget.isOutgoing ? Radius.zero : Radius.circular(_radius),
        ),
      ),
      child: Column(
        crossAxisAlignment: widget.isOutgoing
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hey, do you wanna go out?",
            style: TextStyle(
                fontSize: 16.0,
                color: widget.isOutgoing ? Colors.white : Colors.black),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: widget.isOutgoing
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "12.02",
                style: TextStyle(
                    fontSize: 12.0,
                    color:
                        widget.isOutgoing ? Colors.white60 : Colors.grey[700]),
              ),
              widget.isOutgoing
                  ? widget.isRead
                      ? Icon(
                          Icons.done_all,
                          size: 20.0,
                          color: AppColors.soulPrimary,
                        )
                      : Icon(
                          Icons.done,
                          size: 20.0,
                          color: AppColors.soulPrimary,
                        )
                  : Icon(Icons.done, size: 20, color: Colors.transparent),
            ],
          ),
        ],
      ),
    );
  }
}
