import 'package:flutter/material.dart';
import 'package:starter/model/batch/batch.dart';

class BatchInfoWidget extends StatelessWidget {
  final Batch batch;

  BatchInfoWidget(this.batch);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            _getTitle(),
            style: Theme.of(context).textTheme.title,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          Text(
            _getDate(),
            style: Theme.of(context).textTheme.subtitle,
          ),
          Divider(),
          Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          Text(
            '小芮为您挑选了这个班次，您看行吗？',
            style: Theme.of(context).textTheme.body1,
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('取消'))),
              Expanded(
                child: RaisedButton(
                    color: Colors.purple,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '确定',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  _getTitle() {
    return batch.data.line.name;
  }

  _getDate() {
    return batch.data.ticket.first.date +
        batch.data.ticket.first.arr_ticket.first.time;
  }
}
