import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/conversation.dart';
import 'package:starter/model/msg.dart';

class MsgListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConversationBloc>(builder: (context, logic, _) {
      return ListView.builder(
        itemBuilder: (_, index) => MsgContent(
          msg: logic.conversationList[index],
        ),
        itemCount: logic.conversationList.length,
      );
    });
  }
}

class MsgContent extends StatelessWidget {
  final Msg msg;

  MsgContent({this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(msg.direction == MsgDirection.IN ? 0 : 16),
              bottomRight: Radius.circular(16),
              topRight:
                  Radius.circular(msg.direction == MsgDirection.OUT ? 0 : 16),
              bottomLeft: Radius.circular(16)),
          border: Border.all(color: Colors.grey[400])),
      child: Text(
        msg.content,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}
