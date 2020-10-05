import 'dart:async';

import 'package:laptop_mobile/models/views/order_item.dart';
import 'package:rxdart/subjects.dart';

class OrderBloc {
  OrderBloc() {
    //Subscription of Stream. Return data we need
    additionStream.listen(_handlerAdditionOrder);
    updateStream.listen(_handlerUpdateOrder);
    removeStream.listen(_handlerRemoveOrder);
    cartStream.listen(_handlerOrderInfo);
  }
  //Control event add OrderItem from LaptopDetail
  var additionController = StreamController<OrderItem>();
  Stream<OrderItem> get additionStream => additionController.stream;

  //Control event update OrderItem from LaptopDetail
  final updateController = StreamController<OrderItem>();
  Stream<OrderItem> get updateStream => updateController.stream;

  //Control event update OrderItem from LaptopDetail
  final removeController = StreamController<OrderItem>();
  Stream<OrderItem> get removeStream => removeController.stream;

  //Control cart
  List<OrderItem> _cart = [];
  final cartController = BehaviorSubject<List<OrderItem>>();
  Stream<List<OrderItem>> get cartStream => cartController.stream;

  //Control total quantity items
  int _totalItems = 0;
  final totalItemController = BehaviorSubject<int>();
  Stream<int> get totalItemStream => totalItemController.stream;

  double _totalPrice = 0;
  final totalPriceController = BehaviorSubject<double>();
  Stream<double> get totalPriceStream => totalPriceController.stream;

  void _handlerOrderInfo(List<OrderItem> orderItems) {
    _totalPrice = 0;
    orderItems.forEach((item) {
      _totalPrice += item.laptop.price * item.itemCount;
      print('11111111111${item.laptop.price * item.itemCount}');
    });
    print(': : : $_totalPrice');
    totalPriceController.sink.add(_totalPrice);
  }

  void _handlerAdditionOrder(OrderItem orderItem) {
    _totalItems += orderItem.itemCount;

    _cart.add(orderItem);

    totalItemController.sink.add(_totalItems);
    cartController.sink.add(_cart);
  }

  void _handlerUpdateOrder(OrderItem orderItem) {
    for (var item in _cart) {
      if (item.laptop.laptopId == orderItem.laptop.laptopId) {
        _totalItems -= item.itemCount;

        item.itemCount = orderItem.itemCount;

        _totalItems += orderItem.itemCount;

        totalItemController.sink.add(_totalItems);
        cartController.sink.add(_cart);
        break;
      }
    }
  }

  void _handlerRemoveOrder(OrderItem orderItem) {
    _cart.remove(orderItem);
    totalItemController.sink.add(_totalItems);
    cartController.sink.add(_cart);
  }

  void dispose() {
    additionController.close();
    totalItemController.close();
    cartController.close();
    updateController.close();
    removeController.close();
    totalPriceController.close();
  }
}

final OrderBloc orderBloc = OrderBloc();
