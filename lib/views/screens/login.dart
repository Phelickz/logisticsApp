import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/snackbarService.dart';
import 'package:logistics/services/utils.dart';
import 'package:logistics/state/authState.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category.dart';
import 'forgotPassword.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  @override
  void dispose() {
    myFocusNodePasswordLogin.dispose();
    myFocusNodeEmailLogin.dispose();

    super.dispose();
  }

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _obscureTextLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: _width,
            height: _height,
            color: Colors.black,
          ),
          _login()
        ],
      ),
    );
  }

  Widget _login() {
    return Builder(builder: (BuildContext _context) {
      SnackBarService.instance.buildContext = _context;
      double _height = MediaQuery.of(_context).size.height;
      double _width = MediaQuery.of(_context).size.width;
      return Positioned(
        top: 70.0,
        bottom: 20.0,
        left: 20.0,
        right: 20.0,
        child: Container(
          height: _height * 0.5,
          width: _width * 0.75,
          // color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hi There!',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 40,
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: Text(
                          'Sign into your account',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        // width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: TextFormField(
                          validator: EmailValidator.validate,
                          focusNode: myFocusNodeEmailLogin,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 22.0,
                              ),
                            ),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                                color: Colors.black45,
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        // width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: TextFormField(
                          validator: PasswordValidator.validate,
                          focusNode: myFocusNodePasswordLogin,
                          controller: _passwordController,
                          obscureText: _obscureTextLogin,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            icon: Icon(
                              Icons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.black45,
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleLogin,
                              child: Icon(
                                _obscureTextLogin
                                    ? Icons.remove_red_eye
                                    : Icons.lock_open,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 210),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.aBeeZee(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: _width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: MaterialButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.green,
                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 42.0),
                            child: Text(
                              "SIGN IN",
                              style: GoogleFonts.aBeeZee(
                                fontSize: 25,
                                color: Colors.amber[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () {
                            final form = _formKey.currentState;

                            if (form.validate()) {
                              form.save();
                              try {
                                Provider.of<AuthenticationState>(_context,
                                        listen: false)
                                    .login(_emailController.text,
                                        _passwordController.text)
                                    .then((signInUser) async {
                                  final uid =
                                      await Provider.of<AuthenticationState>(
                                              context,
                                              listen: false)
                                          .currentUserId();
                                  if (uid != null) {
                                    var something = await Firestore.instance
                                        .collection('userData')
                                        .document(uid)
                                        .get();
                                    DocumentSnapshot doc = something;
                                    if (doc['status'] == 'rider') {
                                      var prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString('status', doc['status']);
                                      gotoRiderHomeScreen(context);
                                    } else {
                                      gotoHomeScreen(context);
                                    }
                                  } else {
                                    print('User is null');
                                  }
                                });
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          // onPressed: () =>
                          //     showInSnackBar("Login button pressed")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 100),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                _context,
                                CupertinoPageRoute(
                                    builder: (context) => Category()));
                          },
                          child: Text(
                            'No account? Create!',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Padding(
                      //       padding: EdgeInsets.only(top: 10.0, right: 40.0),
                      //       child: GestureDetector(
                      //         onTap: () {},
                      //         child: Container(
                      //           padding: const EdgeInsets.all(15.0),
                      //           decoration: new BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color: Colors.lightBlueAccent,
                      //           ),
                      //           child: new Icon(
                      //             FontAwesomeIcons.facebookF,
                      //             color: Color(0xFFFFFFFF),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(top: 10.0),
                      //       child: GestureDetector(
                      //         onTap: () {},
                      //         child: Container(
                      //           padding: const EdgeInsets.all(15.0),
                      //           decoration: new BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color: Colors.white,
                      //           ),
                      //           child: new Icon(
                      //             FontAwesomeIcons.google,
                      //             color: Color(0xFF0084ff),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                )),
          ),
        ),
      );
    });
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email cannot be empty";
    }
    return null;
  }
}

class UsernameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Username cannot be empty";
    }
    if (value.length < 2) {
      return "Username is too short";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    }
    return null;
  }
}
