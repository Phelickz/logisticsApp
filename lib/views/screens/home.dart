// import 'package:flutter/material.dart';
// import 'package:flutter_rave/flutter_rave.dart';
// // import 'package:flutter_ravepay/flutter_ravepay.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   // Ravepay ravePay;
//   // RavepayResult _result;

//   // void chargeCard() async {
//   //   final RavepayResult result = await ravePay.chargeCard(
//   //     const RavepayConfig(
//   //       amount: 100.0,
//   //       country: "NG",
//   //       currency: "NGN",
//   //       email: "jeremiahogbomo@gmail.com",
//   //       firstname: "Jeremiah",
//   //       lastname: "Ogbomo",
//   //       narration: "Test Payment",
//   //      
//   //       txRef: "ravePay-1234345",
//   //       useAccounts: false,
//   //       useCards: true,
//   //       isStaging: true,
//   //       useSave: true,
//   //       metadata: [
//   //         const RavepayMeta("email", "dclaire464@gmail.com"),
//   //         const RavepayMeta("id", "1998"),
//   //       ],
//   //     ),
//   //   );

//   //   setState(() {
//   //     _result = result;
//   //   });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     // ravePay = Ravepay.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('widget.title'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Builder(
//           builder: (context) => SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10.0, right: 10),
//               child: InkWell(
//                 onTap: () => _pay(context),
//                 child: Card(
//                   color: Colors.orangeAccent,
//                   elevation: 15,
//                   child: Container(
//                     height: 250,
//                     width: MediaQuery.of(context).size.width,
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             "Card Payment",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(
//                             Icons.payment,
//                             color: Colors.black,
//                             size: 30,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _pay(BuildContext context) {
//     final snackBar_onFailure = SnackBar(content: Text('Transaction failed'));
//     final snackBar_onClosed = SnackBar(content: Text('Transaction closed'));
//     final _rave = RaveCardPayment(
      
//       
//       transactionRef: "hvHPvKYaRuJLlJWSPWwaGGKUyaAfWeZKnm",
//       amount: 100,
//       email: "demo1@example.com",
//       onSuccess: (response) {
//         print("$response");
//         print("Transaction Successful");
//         if (mounted) {
//           Scaffold.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Transaction Sucessful!"),
//               backgroundColor: Colors.green,
//               duration: Duration(
//                 seconds: 5,
//               ),
//             ),
//           );
//         }
//       },
//       onFailure: (err) {
//         print("$err");
//         print("Transaction failed");
//         Scaffold.of(context).showSnackBar(snackBar_onFailure);
//       },
//       onClosed: () {
//         print("Transaction closed");
//         Scaffold.of(context).showSnackBar(snackBar_onClosed);
//       },
//       context: context,
//     );
//     _rave.process();
//   }
// }