import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';

class HomeCards extends StatelessWidget {
  final String url;
  final String text;

  const HomeCards({Key key, this.url, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
          child: Container(
        width: McGyver.rsDoubleW(context, 40),
        height: McGyver.rsDoubleH(context, 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  url ,
                  width: McGyver.rsDoubleW(context, 24),
                  height: 50,
                ),
                Text(text, style: GoogleFonts.aBeeZee(
                  fontSize: SizeConfig().textSize(context, 2.6)
                ),)
              ],
            ) ),
      ),
    );
  }
}
