import 'package:flutter/material.dart';
import 'package:time_tracker/authentication/auth.dart';
import 'package:time_tracker/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Time Tracker App",
      theme:ThemeData(
        primarySwatch:  Colors.indigo,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
