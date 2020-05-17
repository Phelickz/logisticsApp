import 'package:flutter/material.dart';
import 'package:logistics/screens/splashscreen.dart';
import 'package:logistics/state/authState.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthenticationState())],
      child: MaterialApp(
          title: 'Logistics',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen()),
    );
  }
}
