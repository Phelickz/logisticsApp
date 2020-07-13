import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logistics/views/riders/ridersHome.dart';
import 'package:logistics/views/screens/onboarding.dart';
import 'package:logistics/views/users/userHome.dart';
import 'package:provider/provider.dart';
import 'package:logistics/state/authstate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _status;

  void _restorePersistedPreference() async {
    var preferences = await SharedPreferences.getInstance();
    var status = preferences.getString('status') ?? '';
    setState(() => this._status = status);
  }

  @override
  void initState() {
    super.initState();
    _restorePersistedPreference();
    Timer(Duration(seconds: 3), ()async {
      await FirebaseAuth.instance.currentUser()
      // Provider.of<AuthenticationState>(context, listen: false)
      //     .currentUser()
          .then((currentUser) => {
                if (currentUser != null)
                  {
                    if (_status == 'rider')
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainWidget()))
                      }
                    else
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Homepage()))
                      }
                  }
                else
                  {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Onboarding()))
                        .catchError((e) => print(e))
                  }
              })
          .catchError((e) => print(e));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.red[900],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // CircleAvatar(
                      //   radius: 40,
                      //   backgroundColor: Colors.transparent,
                      //   backgroundImage:
                      //       AssetImage('assets/images/arqcoaster_2x.png'),
                      // ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        'SLIQUE',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 50.0,
                            fontFamily: "WorkSansSemiBold"),
                        textAlign: TextAlign.start,
                      ) // or Alignment.topLeft
                      // Text(
                      //   'Slique',
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 24.0,
                      //       fontWeight: FontWeight.bold),
                      // )
                    ],
                  ))),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitChasingDots(color: Colors.blue),
                      // SpinKitPumpingHeart(color: Colors.red),
                      Padding(padding: EdgeInsets.only(top: 20.0)),

                      // Text(
                      //   'Meet. Connect. \n          Love',
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 18.0,
                      //       fontWeight: FontWeight.bold),
                      // )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

// class TopBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       child: Container(
//         height: 100.0,
//       ),
//       painter: CurvePainter(),
//     );
//   }
// }

// class CurvePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//     Paint paint = Paint();

//     path.lineTo(0, size.height * 0.75);
//     path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
//         size.width * 0.17, size.height * 0.90);
//     path.quadraticBezierTo(
//         size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
//     path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
//         size.width * 0.50, size.height * 0.70);
//     path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
//         size.width * 0.65, size.height * 0.65);
//     path.quadraticBezierTo(
//         size.width * 0.70, size.height * 0.90, size.width, 0);
//     path.close();

//     paint.color = colorThree;
//     canvas.drawPath(path, paint);

//     path = Path();
//     path.lineTo(0, size.height * 0.50);
//     path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
//         size.width * 0.15, size.height * 0.60);
//     path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
//         size.width * 0.27, size.height * 0.60);
//     path.quadraticBezierTo(
//         size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
//     path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
//         size.width * 0.75, size.height * 0.75);
//     path.quadraticBezierTo(
//         size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
//     path.lineTo(size.width, 0);
//     path.close();

//     paint.color = colorTwo;
//     canvas.drawPath(path, paint);

//     path = Path();
//     path.lineTo(0, size.height * 0.75);
//     path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
//         size.width * 0.22, size.height * 0.70);
//     path.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
//         size.width * 0.40, size.height * 0.75);
//     path.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
//         size.width * 0.65, size.height * 0.70);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
//     path.lineTo(size.width, 0);
//     path.close();

//     paint.color = colorOne;
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return oldDelegate != this;
//   }
// }
