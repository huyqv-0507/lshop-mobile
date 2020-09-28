import 'dart:async';

import 'package:laptop_mobile/models/repos/laptop_model/laptop.dart';
import 'package:rxdart/subjects.dart';

class LaptopDetailBloc {
  final _chooseLaptopController = StreamController<Laptop>();
  Sink<Laptop> get chooseLaptopSink => _chooseLaptopController.sink;

  final _getLaptopController = BehaviorSubject<Laptop>();
  Stream<Laptop> get viewLaptopStream => _getLaptopController.stream;

  final _itemCount = BehaviorSubject<int>();
  Stream<int> get itemCountStream => _itemCount.stream;

  int _count = 1;

  LaptopDetailBloc() {
    _chooseLaptopController.stream.listen((event) {
      _getLaptopController.sink.add(event);
    });
  }

  void changedItem(String itemChanged) {
    switch (itemChanged) {
      case 'decrement':
        if (_count <= 1) return;
        _count = _count - 1;
        _itemCount.sink.add(_count);
        break;
      case 'increment':
        _count = _count + 1;
        _itemCount.sink.add(_count);
        break;
      default:
    }
  }

  void dispose() {
    _chooseLaptopController.close();
    _getLaptopController.close();
    _itemCount.close();
  }
}

final LaptopDetailBloc laptopDetailBloc = LaptopDetailBloc();
