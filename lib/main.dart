import 'package:flutter/material.dart';
import 'package:logistics/views/riders/ridersHome.dart';

import 'screens/another.dart';
import 'screens/home.dart';
import 'views/users/userHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage()
    );
  }
}

