import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final firebaseStorage = FirebaseStorage(
    app: FirebaseStorage.instance.app,
    storageBucket: "gs://laptopec-db3cb.appspot.com/",
  );
  void getImg() {
    print("OK");
    var url = firebaseStorage
        .ref()
        .child("Laptop APPLEMacBook Air 2020 MWTK2SA:AMWTK2SA:A.png")
        .getDownloadURL()
        .then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          child: FlatButton(onPressed: () => getImg(), child: Text("CLICK"))),
    ));
  }
}
