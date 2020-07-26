import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';


class ActiveCards extends StatelessWidget {
  final bool completed;
  final int index;

  const ActiveCards({Key key, this.completed = false, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: McGyver.rsDoubleH(context, 8),
              child: Card(
                color: Color(0xFFe74c3c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Parcel $index',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3),
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                'Sneakers',
                style: GoogleFonts.aBeeZee(
                    fontSize: SizeConfig().textSize(context, 3),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 43,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order received',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 2),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'nsismkss',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 2),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 43,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'In Transit',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 2),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'nsismkss',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 2),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                 completed ? Icon(
                    Icons.check_circle,
                    size: 43,
                  ) : Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Color(0xFFe74c3c),
                        )),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivered',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 2),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'nsismkss',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 2),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 14)
          ],
        ),
      ),
    );
  }
}
