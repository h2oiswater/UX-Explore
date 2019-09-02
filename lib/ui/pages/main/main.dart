import 'package:flutter/material.dart';

import 'package:starter/ui/widgets/voice_input.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(child: VoiceInputWidget()),
            )
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
