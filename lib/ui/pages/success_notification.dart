import 'package:flutter/material.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';

class SuccessNotification extends StatefulWidget {
  @override
  _SuccessNotificationState createState() => _SuccessNotificationState();
}

class _SuccessNotificationState extends State<SuccessNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: kPrimaryButtonColor,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Thanh toán thành công.'),
      ),
    );
  }
}
