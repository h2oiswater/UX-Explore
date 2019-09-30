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
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  '请选择${widget.count.toString()}位出行乘客',
                  style: Theme.of(context).textTheme.title,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
                Text('点击确定后将为您生成订单')
              ],
            ),
          ),
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
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.passengers[index].name,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                          ),
                          Text(widget.passengers[index].idCard,
                              style: Theme.of(context).textTheme.caption)
                        ],
                      ),
                    ),
                    Icon(
                      selectedIndex[index] == 1
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      color: selectedIndex[index] == 1
                          ? Colors.purple
                          : Colors.grey,
                      size: 32,
                    )
                  ],
                ),
              ),
            ),
            itemCount: widget.passengers.length,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    onPressed: () => Navigator.of(context).pop([]),
                    child: Text('取消'))),
            Expanded(
              child: RaisedButton(
                  color: Colors.purple,
                  onPressed: () {
                    var selected =
                        selectedIndex.where((value) => value > 0).toList();
                    if (selected.length != widget.count) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('选择人数与出行人数不符')));
                      return;
                    }
                    List<Passenger> result = [];
                    for (int p = 0; p < widget.passengers.length; p++) {
                      if (selectedIndex[p] > 0) {
                        result.add(widget.passengers[p]);
                      }
                    }

                    Navigator.of(context).pop(result);
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        )
      ],
    );
  }
}
