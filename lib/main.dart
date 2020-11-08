import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop_mobile/extensions/env/http_config.dart';
import 'package:laptop_mobile/ui/screens/login_ui.dart';

import 'extensions/handlers/color.dart';

Future<void> main() async {
  HttpOverrides.global = HttpConfig();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      body: LoginUI(),
    );
  }
}
