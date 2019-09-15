import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/conversation.dart';

class VoiceInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConversationBloc>(
      builder: (_, conversationBloc, __) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            conversationBloc.currentText,
            style: Theme.of(context).textTheme.body1,
          ),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: InkWell(
                  onTapDown: (_) => conversationBloc.startRecord(),
                  onTapCancel: () => conversationBloc.stopRecord(),
                  onTap: () => conversationBloc.stopRecord(),
                  child: Center(
                    child: Icon(
                      conversationBloc.isRecording
                          ? Icons.fiber_manual_record
                          : Icons.mic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: InkWell(
                  onTap: () => conversationBloc.startPlayer(),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
