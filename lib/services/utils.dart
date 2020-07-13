import 'package:flutter/material.dart';

import 'package:logistics/state/authState.dart';
import 'package:logistics/views/riders/ridersHome.dart';
import 'package:logistics/views/screens/login.dart';
import 'package:logistics/views/users/userHome.dart';
import 'package:provider/provider.dart';

void gotoHomeScreen(BuildContext context) {
  //  print(user['kUID']);
  Future.microtask(() {
    // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
    if (Provider.of<AuthenticationState>(context, listen: false).authStatus ==
        kAuthSuccess) {
      // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    }
  });
}

void gotoRiderHomeScreen(BuildContext context) {
  //  print(user['kUID']);
  Future.microtask(() {
    // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
    if (Provider.of<AuthenticationState>(context, listen: false).authStatus ==
        kAuthSuccess) {
      // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainWidget()));
    }
  });
}

void gotoLoginScreen(BuildContext context) {
  Future.microtask(() {
    if (Provider.of<AuthenticationState>(context, listen: false).authStatus ==
        null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  });
}

// gotoProfileScreen(BuildContext context) async {
//   await Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
// }
