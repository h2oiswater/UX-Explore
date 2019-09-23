import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/user_info.dart';
import 'package:starter/ui/pages/main/voice_input.dart';

import 'msg_list_widget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (context) => UserInfoBloc(context: context),
      child: Scaffold(
        body: SafeArea(
          child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Expanded(child: MsgListWidget()),
                  VoiceInputWidget()
                ],
              )),
        ),
      ),
    );
  }
}
