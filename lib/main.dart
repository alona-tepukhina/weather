import 'package:flutter/material.dart';
import 'package:weather_forecast/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather forecast',
      home: const HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff0E2836),
        brightness: Brightness.dark,
        cardColor: const Color(0xff14394D),
        //iconTheme: const IconThemeData(color: Colors.blue),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xffD6E9FF)),
          bodySmall: TextStyle(color: Color(0xffffffff)),

          // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
    );
  }
}
