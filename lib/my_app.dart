import 'package:flutter/material.dart';
import 'package:gitquotes/screen/homeScreen.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}