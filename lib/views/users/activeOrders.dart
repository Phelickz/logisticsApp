import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/animation/animations.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';
import 'package:logistics/views/widgets/activecards.dart';

class ActiveOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        title: Text('Active Deliveries', style: GoogleFonts.aBeeZee(
          fontSize: SizeConfig().textSize(context, 2.8),
          fontWeight: FontWeight.bold
        ))
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FadeIn(
              delay: 0.5,
              child: ActiveCards()),
          ),
         Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FadeIn(
              delay: 1.5,
              child: ActiveCards()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FadeIn(
              delay: 2.5,
              child: ActiveCards()),
          ),
        ],
      ),
    );
  }
}
