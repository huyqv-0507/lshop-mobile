import 'dart:async';

import 'package:laptop_mobile/models/views/order_item.dart';
import 'package:rxdart/subjects.dart';

class OrderBloc {
  final additionController = StreamController<OrderItem>();
  Stream<OrderItem> get additionStream => additionController.stream;

  final totalItemController = BehaviorSubject<int>();
  Stream<int> get totalItemStream => totalItemController.stream;

  OrderBloc() {
    additionStream.listen(_handlerOrder);
  }

  int _totalItems = 0;
  void _handlerOrder(OrderItem orderItem) {
    _totalItems = _totalItems + orderItem.itemCount;
    print(_totalItems);
    totalItemController.sink.add(_totalItems);
  }

  void dispose() {
    additionController.close();
    totalItemController.close();
  }
}

final OrderBloc orderBloc = OrderBloc();
