import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';
import 'package:logistics/views/widgets/requestcards.dart';

class AddOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: redColor,
        title: Text(
          'Request Order',
          style: GoogleFonts.aBeeZee(
              fontSize: SizeConfig().textSize(context, 3),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transport Medium',
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig().textSize(context, 3)),
            ),
            SizedBox(height: McGyver.rsDoubleH(context, 2)),
            Wrap(
              children: [
                RequestCards(
                  url: 'assets/images/truck.svg',
                ),
                RequestCards(url: 'assets/images/airplane (2).svg'),
                RequestCards(
                  url: 'assets/images/undraw_on_the_way_ldaq (1).svg',
                )
              ],
            ),
            SizedBox(height: McGyver.rsDoubleH(context, 4)),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: redColor,
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    'From: ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: SizeConfig().textSize(context, 3)),
                  ),
                ),
                Text(
                  'California, USA',
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig().textSize(context, 3)),
                )
              ],
            ),
            Divider(thickness: 2,)
          ],
        ),
      ),
    );
  }
}
