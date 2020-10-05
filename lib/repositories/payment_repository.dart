import 'package:http/http.dart' as http;
import 'package:laptop_mobile/extensions/env/env.dart';
import 'package:laptop_mobile/models/repos/order_info.dart';

class PaymentRepository {
  Future<String> payOrder(OrderInfo orderInfo) async {
    String paymentUrl =
        'payment?OrderId=${orderInfo.orderId}&Amount=${orderInfo.amount}&vnp_TransactionNo=${orderInfo.vpntransactionno}&vnp_TxnResponseCode=${orderInfo.vpntxnResponseCode}';
    print('${Env.baseUrl(paymentUrl)}');
    final res =
        await http.post(Env.baseUrl(paymentUrl), headers: Env.baseHeader);
    if (res.statusCode == 200) {
      print('${res.body}');
      return res.body;
    } else {
      throw Exception('Failed to Payment - ${res.statusCode}');
    }
  }
}
