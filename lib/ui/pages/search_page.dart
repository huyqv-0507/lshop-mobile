import 'package:flutter/material.dart';
import 'package:laptop_mobile/extensions/handlers/color.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          BackButton(
            color: kPrimaryButtonColor,
          ),
          Expanded(
              child: Center(
            child: TextField(
              cursorColor: kPrimaryLabelTextColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter name, brand, ...',
              ),
            ),
          )),
        ],
      ),
    ));
  }
}
