import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/conversation.dart';
import 'package:starter/model/msg.dart';

class MsgListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConversationBloc>(builder: (context, value, _) {
      return ListView.builder(
        itemBuilder: (_, index) => MsgContent(
          msg: value.conversationList[index],
        ),
        itemCount: value.conversationList.length,
      );
    });
  }
}

class MsgContent extends StatelessWidget {
  final Msg msg;

  MsgContent({this.msg});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: msg.direction == MsgDirection.IN
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                border: Border.all(color: Colors.grey[400])),
            child: Text(
              msg.content,
              style: Theme.of(context).textTheme.body1,
            ),
          )
        ]);
  }
}
