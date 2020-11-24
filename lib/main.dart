import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_page.dart';
import 'package:quiz_app/screens/quiz_page.dart';
import 'package:quiz_app/screens/topic_page.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        '/quiz_page': (context) => QuizPage(),
        '/topic_page': (context) => TopicPage(),
      },
      initialRoute: '/home',
      // home: HomePage(),
    ),
  );
}
