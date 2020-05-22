import 'package:flutter/material.dart';
import 'package:logistics/views/users/sidebar/sidebar_layout.dart';
import 'package:logistics/views/users/userHome.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            }),
      ),
    );
  }
}
