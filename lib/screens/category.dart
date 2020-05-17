import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistics/views/riders/registerRider.dart';
import 'package:logistics/views/users/registerUser.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.3,
          color: Colors.red,
          child: Column(
            children: <Widget>[
              _button(true, context),
              SizedBox(height: 15),
              _button(false, context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(bool isUser, context) {
    return RaisedButton(
      child: Text(isUser ? 'Client' : 'Rider'),
      onPressed: () {
        isUser
            ? Navigator.push(context,
                CupertinoPageRoute(builder: (context) => RegisterUser()))
            : Navigator.push(context,
                CupertinoPageRoute(builder: (context) => RegisterRider()));
      },
    );
  }
}
