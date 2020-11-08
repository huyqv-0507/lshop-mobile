import 'package:flutter/material.dart';
import 'package:laptop_mobile/blocs/payment_bloc/payment_bloc.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'success_notification.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  WebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: kPrimaryButtonColor,
        ),
        title: Text('VNPay', style: TextStyle(color: Colors.black)),
      ),
      body: StreamBuilder<String>(
          stream: paymentBloc.paymentUrlStream,
          builder: (context, snapshot) {
            print('${snapshot.data}');
            return snapshot.hasData
                ? WebView(
                    initialUrl: '${snapshot.data}',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    navigationDelegate: (navigation) {
                      if (navigation.url.contains("https://vnpay.vn/")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessNotification()));
                        return NavigationDecision.navigate;
                      }
                      webViewController.loadUrl(navigation.url);
                      return NavigationDecision.prevent;
                    },
                  )
                : Container();
          }),
    );
  }
}
