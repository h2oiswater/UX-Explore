import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/api.dart';
import 'package:starter/bloc/conversation.dart';
import 'package:starter/bloc/user_info.dart';
import 'package:starter/ui/pages/main/voice_input.dart';

import 'msg_list_widget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProxyProvider<APIProvider, UserInfoBloc>(
          builder: (context, api, previous) => (previous ?? UserInfoBloc())
            ..api = api
            ..context = context,
        ),
        ChangeNotifierProxyProvider2<APIProvider, UserInfoBloc, ConversationBloc>(
          builder: (context, api, userInfoBloc, previous) =>
              (previous ?? ConversationBloc())
                ..api = api
                ..context = context
                ..userInfoBloc = userInfoBloc,
        )
      ],
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
