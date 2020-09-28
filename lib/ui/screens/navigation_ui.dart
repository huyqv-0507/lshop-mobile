import 'package:flutter/material.dart';
import 'package:laptop_mobile/blocs/navbar_bloc/navbar_bloc.dart';
import 'package:laptop_mobile/ui/navs/cart_nav.dart';
import 'package:laptop_mobile/ui/navs/home_nav.dart';
import 'package:laptop_mobile/ui/navs/notification_nav.dart';
import 'package:laptop_mobile/ui/navs/profile_nav.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavigationUI extends StatefulWidget {
  @override
  _NavigationUIState createState() => _NavigationUIState();
}

class _NavigationUIState extends State<NavigationUI> {
  int selectedNav = 0;
  final List titleItems = <String>['Home', 'Explore', 'Notification', 'Me'];
  final List navbars = <Widget>[
    HomeNav(),
    CartNav(),
    NotificationNav(),
    ProfileNav()
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 0,
        stream: navbarBloc.navItemStream,
        builder: (context, snapshot) {
          return Scaffold(
              body: navbars.elementAt(snapshot.data),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: navbarBloc.navItemSink.add,
                  currentIndex: snapshot.data,
                  elevation: 5.0,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(MdiIcons.homeOutline),
                        title: Text('${titleItems.elementAt(snapshot.data)}')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.laptop_outlined),
                        title: Text('${titleItems.elementAt(snapshot.data)}')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notifications_outlined),
                        title: Text('${titleItems.elementAt(snapshot.data)}')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle_outlined),
                        title: Text('${titleItems.elementAt(snapshot.data)}')),
                  ]));
        });
  }
}
