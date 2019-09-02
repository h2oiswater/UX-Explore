import 'package:flutter/material.dart';

class VoiceInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const icon = Icons.mic;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Hello',
          style: Theme.of(context).textTheme.body1,
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
            onTapDown: (_) => print('onTapDown'),
            onTapCancel: () => print('onTapCancel'),
            onTap: () => print("onTap"),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
