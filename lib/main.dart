import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop_mobile/ui/screens/navigation_ui.dart';

import 'extensions/handlers/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.nunitoTextTheme()),
      home: LSApp(),
    );
  }
}

class LSApp extends StatefulWidget {
  @override
  _LSAppState createState() => _LSAppState();
}

class _LSAppState extends State<LSApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLoginUiColor,
      body: NavigationUI(),
    );
  }
}
