// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:paystack_flutter/paystack_flutter.dart';


// class MyApps extends StatefulWidget {
//   @override
//   _MyAppsState createState() => new _MyAppsState();
// }

// class _MyAppsState extends State<MyApps> {
//   String transcation = 'No transcation Yet';
//   Map<String, dynamic> _data = {};

//   static const platform = const MethodChannel('maugost.com/paystack_flutter');
//   static const paystack_pub_key = "Your_paystack_public_key";
//   static const paystack_backend_url =
//       "https://infinite-peak-60063.herokuapp.com";

//   @override
//   initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Flutter Paystack '),
//         ),
//         body: new Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(transcation),
//               new Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: new RaisedButton(
//                   child: new Text("Pay with Paystack N100"),
//                   onPressed: connectPaystack,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   connectPaystack() async {
//     String result;
//     try {
//       result = await PaystackFlutter.connectToPaystack({
//         "NAME": "Your Name",
//         "EMAIL": "you@email.com",
//         "AMOUNT": 100,
//         "CURRENCY": "NGN",
//         "PAYMENT_FOR": "Testing API",
//         "PAYSTACK_PUBLIC_KEY": paystack_pub_key, pk_test_73862b46b977289f342db20e73049899f9d945c2
//         "BACKEND_URL": paystack_backend_url,
//       });
//     } on PlatformException catch (e) {
//       result = e.message;
//       print(e.message);
//     }

//     if (!mounted) return;

//     setState(() {
//       transcation = result;
//     });
//   }
// }