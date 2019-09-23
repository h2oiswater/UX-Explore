import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogicWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;

  LogicWidget({Key key, this.model, this.builder, this.child, this.onModelReady})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LogicWidgetState();
  }
}

class _LogicWidgetState<T extends ChangeNotifier>
    extends State<LogicWidget<T>> {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  T model;

  @override
  void initState() {
    // assign the model once when state is initialised
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
