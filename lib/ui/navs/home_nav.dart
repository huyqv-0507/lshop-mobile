import 'package:flutter/material.dart';
import 'package:laptop_mobile/blocs/laptop_bloc/laptop_bloc.dart';
import 'package:laptop_mobile/blocs/laptop_bloc/laptop_detail_bloc.dart';
import 'package:laptop_mobile/blocs/order_bloc/order_bloc.dart';
import 'package:laptop_mobile/extensions/handlers/border_handler.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';
import 'package:laptop_mobile/extensions/handlers/float_button_handler.dart';
import 'package:laptop_mobile/extensions/handlers/modify_string.dart';
import 'package:laptop_mobile/extensions/handlers/padding_size.dart';
import 'package:laptop_mobile/extensions/handlers/text_style_handler.dart';
import 'package:laptop_mobile/models/repos/laptop_model/laptop.dart';
import 'package:laptop_mobile/ui/pages/laptop_detail_page.dart';
import 'package:laptop_mobile/ui/pages/search_page.dart';

class HomeNav extends StatefulWidget {
  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  @override
  void initState() {
    laptopBloc.fetchAllLaptops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'LShop',
          style: TextStyleHandler.labelText,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: kPrimaryButtonColor,
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage())))
        ],
      ),
      body: _homeBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Stack(children: [
        FloatButtonHandler.floatPrimaryButton,
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
            child: StreamBuilder<int>(
                initialData: 0,
                stream: orderBloc.totalItemController,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Text(
                          '${snapshot.data}',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text('0', style: TextStyle(color: Colors.white));
                }),
          ),
        )
      ]),
    ));
  }

  Widget _homeBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              'assets/images/ads.png',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              ),
              _horizontalSpace(5),
              Container(
                width: 10,
                height: 10,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              _horizontalSpace(5),
              Container(
                width: 10,
                height: 10,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
            child: Column(
              children: [
                _verticalSpace(10),
                _bestSeller(),
                _verticalSpace(10),
                _recommed()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _horizontalSpace(double space) {
    return SizedBox(
      width: space,
    );
  }

  Widget _bestSeller() {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Best seller',
              style: TextStyleHandler.categoryLabelHome,
            )),
        _verticalSpace(8),
        StreamBuilder<List<Laptop>>(
          initialData: <Laptop>[],
          stream: laptopBloc.fetchLaptopsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 190,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return _bestSellerItem(snapshot.data[index]);
                    }),
              );
            }
            if (snapshot.hasError) {}
            return CircularProgressIndicator();
          },
        )
      ],
    );
  }

  void _gotoDetail(laptop) {
    laptopDetailBloc.chooseLaptopSink.add(laptop);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LaptopDetail(),
    ));
  }

  Widget _bestSellerItem(Laptop laptop) {
    return InkWell(
      onTap: () => _gotoDetail(laptop),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(kdefaultBorder),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 3,
                    spreadRadius: .3,
                    color: Colors.grey[100]),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderHandler.brDefaultImageBorder),
                  child: ClipRRect(
                    borderRadius: BorderHandler.brDefaultImageBorder,
                    child: Image.asset(
                      'assets/images/laptop.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kdefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          laptop.laptopName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyleHandler.titleItem,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${ModifyString.formatPriceVN(laptop.price)}',
                          style: TextStyleHandler.priceItem,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recommed() {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recommend for you',
              style: TextStyleHandler.categoryLabelHome,
            )),
        _verticalSpace(8),
        StreamBuilder<List<Laptop>>(
          initialData: <Laptop>[],
          stream: laptopBloc.fetchLaptopsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return _recommendItem(snapshot.data[index]);
                    }),
              );
            }
            if (snapshot.hasError) {}
            return CircularProgressIndicator();
          },
        )
      ],
    );
  }

  Widget _recommendItem(Laptop laptop) {
    return InkWell(
      onTap: () => _gotoDetail(laptop),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(kdefaultBorder),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 3,
                  spreadRadius: .3,
                  color: Colors.grey[100]),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderHandler.brDefaultImageBorder),
                child: ClipRRect(
                  borderRadius: BorderHandler.brDefaultImageBorder,
                  child: Image.asset(
                    'assets/images/laptop.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kdefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        laptop.laptopName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyleHandler.titleItem,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${ModifyString.formatPriceVN(laptop.price)}',
                        style: TextStyleHandler.priceItem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalSpace(double space) {
    return SizedBox(
      height: space,
    );
  }
}
