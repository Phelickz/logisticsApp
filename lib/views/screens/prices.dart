import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/colors.dart';

class Prices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        title: Text('Price List', style: GoogleFonts.aBeeZee(
        ),),
      ),
      body: Center(
        child: Text('Prices would appear here'),
      ),
    );
  }
}