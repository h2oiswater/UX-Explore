import 'package:flutter/cupertino.dart';

class APP {
  static BuildContext _context;

  static setContext(value) {
    _context = value;
  }

  static BuildContext getContext() {
    return _context;
  }
}
