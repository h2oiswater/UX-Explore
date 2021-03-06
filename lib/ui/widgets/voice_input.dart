import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/conversation.dart';

class VoiceInputWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VoiceInputWidgetState();
  }
}

class VoiceInputWidgetState extends State<VoiceInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConversationBloc>(builder: (context, value, _) {
      final icon = value.isRecording ? Icons.fiber_manual_record : Icons.mic;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value.currentText,
            style: Theme.of(context).textTheme.body1,
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
                  onTapDown: (_) => value.startRecord(),
                  onTapCancel: () => value.stopRecord(),
                  onTap: () => value.stopRecord(),
                  child: Center(
                    child: Icon(
                      icon,
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
                  onTap: () => value.startPlayer(),
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
      );
    });
  }
}
