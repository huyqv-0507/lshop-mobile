import 'dart:async';

import 'package:laptop_mobile/models/repos/order_info.dart';
import 'package:laptop_mobile/repositories/payment_repository.dart';

class PaymentBloc {
  OrderInfo _orderInfo;

  PaymentBloc() {
    paymentStream.listen((totalPrice) => {
          _orderInfo = OrderInfo(05, totalPrice, 00, 'OK', '00'),
          pay(_orderInfo)
        });
  }

  final paymentController = StreamController<double>.broadcast();
  Sink<double> get paymentSink => paymentController.sink;
  Stream<double> get paymentStream => paymentController.stream;

  final paymentUrlController = StreamController<String>.broadcast();
  Stream<String> get paymentUrlStream => paymentUrlController.stream;

  final paymentResultController = StreamController<double>();
  Sink<double> get paymentResultSink => paymentResultController.sink;
  Stream<double> get paymentResultStream => paymentResultController.stream;

  final paymentRepo = PaymentRepository();

  pay(OrderInfo orderInfo) async {
    await paymentRepo
        .payOrder(orderInfo)
        .then((paymentUrl) => paymentUrlController.sink.add(paymentUrl))
        .catchError((onError) => print(onError));
  }

  void dispose() {
    paymentController.close();
    paymentResultController.close();
    paymentUrlController.close();
  }
}

final PaymentBloc paymentBloc = PaymentBloc();
