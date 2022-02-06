import 'package:flutter/material.dart';
import 'package:news_app_ui/screens/homepage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // List<News> bookmarkedNews = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        // fontFamily: 'Poppins',
      ),
      home: const HomePage(),
    );
  }
}
