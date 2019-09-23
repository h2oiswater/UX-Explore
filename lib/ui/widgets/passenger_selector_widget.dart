import 'package:flutter/material.dart';
import 'package:starter/model/passenger.dart';

class PassengerSelectorWidget extends StatefulWidget {
  final int count;
  final List<Passenger> passengers;

  PassengerSelectorWidget({this.count = 1, @required this.passengers});

  @override
  State<StatefulWidget> createState() {
    return PassengerSelectorWidgetState();
  }
}

class PassengerSelectorWidgetState extends State<PassengerSelectorWidget> {
  List<int> selectedIndex;

  @override
  void initState() {
    selectedIndex = List.filled(widget.passengers.length, -1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '请选择${widget.count.toString()}位出行乘客',
          style: Theme.of(context).textTheme.title,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                setState(() {
                  selectedIndex[index] = -selectedIndex[index];
                });
              },
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(widget.passengers[index].name),
                      Text(widget.passengers[index].idCard)
                    ],
                  ),
                  color: selectedIndex[index] > 0 ? Colors.blue : Colors.white),
            ),
            itemCount: widget.passengers.length,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('取消'))),
            Expanded(
              child: RaisedButton(
                  onPressed: () {
                    var selected =
                        selectedIndex.where((value) => value > 0).toList();
                    if (selected.length != widget.count) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('选择人数与出行人数不符')));
                    }
                    List<Passenger> result = [];
                    for (int p = 0; p < widget.passengers.length; p++) {
                      if (selectedIndex[p] > 0) {
                        result.add(widget.passengers[p]);
                      }
                    }

                    Navigator.of(context).pop(result);
                  },
                  child: Text('确定')),
            )
          ],
        )
      ],
    );
  }
}
