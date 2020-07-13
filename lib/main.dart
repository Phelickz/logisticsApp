import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics/state/authState.dart';
import 'package:logistics/views/screens/onboarding.dart';
import 'package:provider/provider.dart';

import 'views/screens/splashscreen.dart';
import 'package:device_preview/device_preview.dart';

void main() {runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
  
    )
  );}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthenticationState())],
      child: GetMaterialApp(
        locale: DevicePreview.of(context).locale,
        builder: DevicePreview.appBuilder,
          title: 'Logistics',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen()),
    );
  }
}
