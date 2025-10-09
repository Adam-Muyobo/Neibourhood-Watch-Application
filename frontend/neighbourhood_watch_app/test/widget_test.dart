import 'package:flutter/material.dart';
import 'package:neighbourhood_watch_app/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Signup Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SignupPage(),
    );
  }
}
