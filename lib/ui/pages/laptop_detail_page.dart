import 'package:flutter/material.dart';
import 'package:laptop_mobile/blocs/laptop_bloc/laptop_detail_bloc.dart';
import 'package:laptop_mobile/blocs/order_bloc/order_bloc.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';
import 'package:laptop_mobile/extensions/handlers/modify_string.dart';
import 'package:laptop_mobile/extensions/handlers/padding_size.dart';
import 'package:laptop_mobile/extensions/handlers/text_style_handler.dart';
import 'package:laptop_mobile/models/repos/laptop_model/laptop.dart';
import 'package:laptop_mobile/models/views/order_item.dart';
import 'package:laptop_mobile/ui/pages/cart_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LaptopDetail extends StatefulWidget {
  @override
  _LaptopDetailState createState() => _LaptopDetailState();
}

class _LaptopDetailState extends State<LaptopDetail> {
  Laptop _laptop;
  int _count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: BackButton(
            color: kPrimaryButtonColor,
          ),
          backgroundColor: Colors.white,
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CardPage())),
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      MdiIcons.cart,
                      color: kPrimaryButtonColor,
                    ),
                    onPressed: null,
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                        child: StreamBuilder<int>(
                            initialData: 0,
                            stream: orderBloc.totalItemController,
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Text(
                                      '${snapshot.data}',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : Text('0');
                            }),
                      ))
                ],
              ),
            ),
          ],
        ),
        body: _detailBody(),
        bottomNavigationBar: FlatButton(
          onPressed: () =>
              orderBloc.additionController.add(OrderItem(_laptop, _count)),
          child: Container(
            margin: EdgeInsets.all(8),
            height: 50,
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
                'Add to bag',
                style: TextStyle(
                    color: kSecondaryTextColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }

  Widget _detailBody() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          kdefaultPadding, kdefaultPadding, kdefaultPadding, 0),
      child: SingleChildScrollView(
        child: Container(
          child: StreamBuilder<Laptop>(
              stream: laptopDetailBloc.viewLaptopStream,
              builder: (context, snapshot) {
                _laptop = snapshot.data;
                return snapshot.hasData
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${snapshot.data.laptopName}',
                                style: TextStyleHandler.categoryLabelHome,
                              )),
                          Container(
                            width: double.infinity,
                            height: 250,
                            child: Image.asset(
                              'assets/images/laptop.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Wrap(
                                alignment: WrapAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                      'assets/images/laptop.jpeg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                      'assets/images/laptop.jpeg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                      'assets/images/laptop.jpeg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              ),
                              _horizontalSpace(5),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                              ),
                              _horizontalSpace(5),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Description:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      Text('CPU: ${snapshot.data.seriesCPU}')),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    'Display screen: ${snapshot.data.displayScreen}'),
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('RAM: ${snapshot.data.ram}')),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      'Graphic card: ${snapshot.data.graphicCard}')),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      'Storage: ${snapshot.data.storage}')),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('OS: Windows 10 Home 64bit}')),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      'Weight: ${snapshot.data.weight}kg')),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text('Price: '),
                                      Text(
                                          '${ModifyString.formatPriceVN(snapshot.data.price)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20))
                                    ],
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _decrementItemCount(),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: _itemCount()),
                                  _incrementItemCount()
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    : CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

  Widget _decrementItemCount() {
    return FlatButton(
      onPressed: () => laptopDetailBloc.changedItem('decrement'),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1)),
        child: Center(
          child: Text(
            '-',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _incrementItemCount() {
    return FlatButton(
      onPressed: () => laptopDetailBloc.changedItem('increment'),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1)),
        child: Center(
          child: Text('+', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _itemCount() {
    return StreamBuilder<Object>(
        initialData: 1,
        stream: laptopDetailBloc.itemCountStream,
        builder: (context, snapshot) {
          _count = snapshot.data;
          return snapshot.hasData ? Text('${snapshot.data}') : Container();
        });
  }

  Widget _horizontalSpace(double space) {
    return SizedBox(
      width: space,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
