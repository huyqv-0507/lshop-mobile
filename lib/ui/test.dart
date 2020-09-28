import 'package:flutter/material.dart';
import 'package:laptop_mobile/models/repos/laptop_model/laptop.dart';
import 'package:laptop_mobile/repositories/laptop_repository.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final repos = LaptopRepository();
  List laptops = <Laptop>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            color: Colors.pink,
            onPressed: () async {
              await repos
                  .fetchLaptops()
                  .then((value) => {laptops = value})
                  .catchError((onError) => print(onError));
            },
            child: Text('Click to test APIs')),
      ),
    );
  }
}
