import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/animation/animations.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/views/widgets/activecards.dart';

import 'userHome.dart';

class CompletedOrders extends StatefulWidget {
  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        title: Text('Completed Orders',
            style: GoogleFonts.aBeeZee(
                fontSize: SizeConfig().textSize(context, 2.8),
                fontWeight: FontWeight.bold)),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            }),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FadeIn(delay: 0.5, child: ActiveCards(completed: true,)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FadeIn(delay: 1.5, child: ActiveCards(completed: true,)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FadeIn(delay: 2.5, child: ActiveCards(completed: true,)),
          ),
        ],
      ),
    );
  }
}
