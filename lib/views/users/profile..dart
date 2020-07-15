import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';
import 'package:logistics/views/users/sidebar/sidebar_layout.dart';
import 'package:logistics/views/users/userHome.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String phoneNumber = "+2348066701121";
  String email = 'user@user.com';
  String desc = "";
  String name = 'User';
  String address = 'Ago Palace Way surulere Lagos';
  String img;
  String photo = '';

  SizeConfig size = SizeConfig();

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      setState(() {
        email = user.email;
        name = user.displayName;
        phoneNumber = user.phoneNumber;
        photo = user.photoUrl;
        print(name);
        // img = user.photoUrl;
      });
    });
  }

  bool darktheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: redColor,
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: redColor,
              centerTitle: false,
              title: Text(
                'Profile',
                style: GoogleFonts.aBeeZee(
                    fontSize: SizeConfig().textSize(context, 3),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  // getImage();
                },
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 106,
                    height: 106,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(photo)),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: redColor, width: 3, style: BorderStyle.solid),
                    ),
                    // child: _image == null
                    //     ? SizedBox()
                    //     : Image.file(
                    //         _image,
                    //         fit: BoxFit.cover,
                    //       ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 2),
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            SizedBox(height: McGyver.rsDoubleH(context, 4)),
            Expanded(
              child: Container(
                width: size.xMargin(context, 100),
                height: size.yMargin(context, 100),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Display Name',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          name,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Email Address',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          email,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Phone',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          phoneNumber ?? '',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
