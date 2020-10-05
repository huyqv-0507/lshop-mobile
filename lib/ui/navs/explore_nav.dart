import 'package:flutter/material.dart';
import 'package:laptop_mobile/blocs/order_bloc/order_bloc.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';
import 'package:laptop_mobile/ui/pages/cart_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExploreNav extends StatefulWidget {
  @override
  _ExploreNavState createState() => _ExploreNavState();
}

class _ExploreNavState extends State<ExploreNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      automaticallyImplyLeading: true,
      leading: BackButton(
        color: kPrimaryButtonColor,
      ),
      title: Center(child: Text('Explore')),
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
      backgroundColor: Colors.white,
    ));
  }
}
