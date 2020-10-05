class OrderInfo {
  final dynamic orderId;
  final double amount;
  final dynamic vpntransactionno;
  final String vpnmessage;
  final String vpntxnResponseCode;

  OrderInfo(this.orderId, this.amount, this.vpntransactionno, this.vpnmessage,
      this.vpntxnResponseCode);
}
