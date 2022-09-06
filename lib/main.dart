import 'package:five_day_weather/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5 day weather forecast',
      home: const HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff0E2836),
        brightness: Brightness.dark,
        //primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
    );
  }
}
