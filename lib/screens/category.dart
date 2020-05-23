import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/screens/login.dart';
import 'package:logistics/views/riders/registerRider.dart';
import 'package:logistics/views/users/registerUser.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.black,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    children: <Widget>[
                      _button(true, context),
                      SizedBox(height: 50),
                      _button(false, context)
                    ],
                  ),
                ),
              ),
            ),
            _text(width, height),
            _login(context, width, height)
          ],
        ));
  }

  Widget _login(context, double width, double height) {
    return Positioned(
        top: height * 0.8,
        left: width * 0.28,
        child: InkWell(
          splashColor: Colors.amber[900],
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text(
            'Have an account? Login',
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
        ));
  }

  Widget _text(double width, double height) {
    return Positioned(
        top: height * 0.2,
        left: width * 0.3,
        child: Text(
          'Register as',
          style: GoogleFonts.aBeeZee(
              fontSize: 34,
              color: Colors.amber[800],
              fontWeight: FontWeight.bold),
        ));
  }

  Widget _button(bool isUser, context) {
    return Container(
      width: 180,
      child: FloatingActionButton.extended(
        heroTag: isUser ? "user" : "rider",
        backgroundColor: Colors.amber[900],
        icon: isUser ? Icon(Icons.account_circle) : Icon(Icons.motorcycle),
        label: Text(
          isUser ? 'Client' : 'Rider',
          style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          isUser
              ? Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => RegisterUser()))
              : Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => RegisterRider()));
        },
      ),
    );
  }
}
