import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'homeScreenPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          accentColor: Colors.deepPurple,
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          backgroundColor: Colors.deepPurple,
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.white, fontSize: 18),
        )
      ),
    );
  }
}


