import 'package:flutter/material.dart';
import 'package:laptop_mobile/blocs/order_bloc/order_bloc.dart';
import 'package:laptop_mobile/blocs/payment_bloc/payment_bloc.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';
import 'package:laptop_mobile/extensions/handlers/modify_string.dart';
import 'package:laptop_mobile/extensions/handlers/padding_size.dart';
import 'package:laptop_mobile/extensions/handlers/text_style_handler.dart';
import 'package:laptop_mobile/models/views/order_item.dart';
import 'package:laptop_mobile/ui/pages/payment_page.dart';
import 'package:laptop_mobile/ui/test.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: BackButton(
            color: kPrimaryButtonColor,
          ),
          title: StreamBuilder(
            initialData: 0,
            stream: orderBloc.totalItemStream,
            builder: (context, snapshot) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      'My cart',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text('${snapshot.data} items',
                        style: TextStyle(color: Colors.black, fontSize: 13))
                  ],
                ),
              );
            },
          ),
          actions: [
            IconButton(
                icon: Icon(MdiIcons.trashCan, color: Colors.black),
                onPressed: null)
          ],
          backgroundColor: Colors.white,
        ),
        body: Stack(children: [_cartBody(), _totalPrice()]),
        bottomNavigationBar: StreamBuilder<double>(
            stream: orderBloc.totalPriceStream,
            builder: (context, snapshot) {
              return FlatButton(
                onPressed: () => _gotoPayment(snapshot.data),
                child: Container(
                  margin: EdgeInsets.all(8),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kPrimaryButtonColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 10,
                            color: kBoxShadowFormColor,
                            offset: Offset(0, 13),
                            spreadRadius: -12)
                      ]),
                  child: Center(
                    child: Text(
                      'Pay with VNPay',
                      style: TextStyle(
                          color: kSecondaryTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }));
  }

  Widget _cartBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _verticalSpace(),
          _deliveryAddress(),
          _verticalSpace(),
          _items()
        ],
      ),
    );
  }

  Widget _deliveryAddress() {
    return Column(
      children: [
        Text(
          'Shipping to:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        FlatButton(
            color: kPrimaryColor,
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Test())),
            child: Container(
              child: Text('Choose on map'),
            ))
      ],
    );
  }

  Widget _items() {
    return Container(
      child: StreamBuilder<List<OrderItem>>(
          initialData: [],
          stream: orderBloc.cartStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            leading: Image.asset('assets/images/laptop.jpeg'),
                            title: Text(
                                '${snapshot.data[index].laptop.laptopName}'),
                            subtitle: Text(
                                '${ModifyString.formatPriceVN(snapshot.data[index].laptop.price)}'),
                            trailing: Text('x${snapshot.data[index].itemCount}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))),
                      );
                    },
                  )
                : Text('Cart is empty');
          }),
    );
  }

  Widget _totalPrice() {
    return Positioned(
      left: kdefaultPadding,
      bottom: 20,
      child: StreamBuilder<double>(
        stream: orderBloc.totalPriceStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Text(
                  'Total: ${ModifyString.formatPriceVN(snapshot.data)}',
                  style: TextStyleHandler.titleItem,
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }

  void _gotoPayment(double totalPrice) {
    paymentBloc.paymentSink.add(totalPrice);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PaymentPage()));
  }

  Widget _verticalSpace() {
    return SizedBox(
      height: kdefaultPadding,
    );
  }
}
