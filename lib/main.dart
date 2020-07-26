import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logistics/state/authState.dart';
import 'views/screens/splashscreen.dart';
import 'package:device_preview/device_preview.dart';


final pv = ChangeNotifierProvider((_) => AuthenticationState());

void main() {runApp(
   /* DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>*/ ProviderScope(child: MyApp()),
  
    // )
  );}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
        title: 'Logistics',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}
