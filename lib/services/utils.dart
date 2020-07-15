import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:logistics/state/authState.dart';
import 'package:logistics/state/providers.dart';
import 'package:logistics/views/authScreen/welcome/welcome.dart';
import 'package:logistics/views/riders/ridersHome.dart';
import 'package:logistics/views/screens/login.dart';
import 'package:logistics/views/users/userHome.dart';


void gotoHomeScreen(BuildContext context, AuthenticationState state) {
  
  //  print(user['kUID']);
  Future.microtask(() {
    // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
    if (state.authStatus ==
        kAuthSuccess) {
      // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    }
  });
}

void gotoRiderHomeScreen(BuildContext context, AuthenticationState state) {
  //  print(user['kUID']);
  Future.microtask(() {
    // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
    if (state.authStatus ==
        kAuthSuccess) {
      // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainWidget()));
    }
  });
}

void gotoLoginScreen(BuildContext context, AuthenticationState state) {
  Future.microtask(() {
    if (state.authStatus ==
        null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }
  });
}

// gotoProfileScreen(BuildContext context) async {
//   await Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
// }
