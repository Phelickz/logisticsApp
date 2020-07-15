import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';
import 'package:logistics/views/widgets/requestcards.dart';

class AddOrder extends StatefulWidget {
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  List<bool> color = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: redColor,
          icon: Icon(Icons.exit_to_app),
          onPressed: () {},
          label: Text('Proceed')),
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
        child: SingleChildScrollView(
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
                    color: color[0] ? redColor : null,
                    onTap: () {
                      // print(color[0]);
                      setState(() {
                        color[0] = !color[0];
                        color[1] = false;
                        color[2] = false;
                        // print(color[0]);
                      });
                    },
                    url: 'assets/images/truck.svg',
                  ),
                  RequestCards(
                      color: color[1] ? redColor : null,
                      onTap: () {
                        // print(color[1]);
                        setState(() {
                          color[1] = !color[1];
                          color[0] = false;
                          color[2] = false;
                          // print(color[0]);
                        });
                      },
                      url: 'assets/images/airplane (2).svg'),
                  RequestCards(
                    color: color[2] ? redColor : null,
                    onTap: () {
                      // print(color[2]);
                      setState(() {
                        color[2] = !color[2];
                        color[0] = false;
                        color[1] = false;
                        // print(color[2]);
                      });
                    },
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
                    padding: const EdgeInsets.only(left: 8.0),
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
              Divider(
                thickness: 2,
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 3)),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 30,
                    color: redColor,
                  ),
                  SizedBox(width: McGyver.rsDoubleH(context, 2)),
                  Text(
                    'Date: ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: SizeConfig().textSize(context, 3)),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        height: McGyver.rsDoubleH(context, 5),
                        width: McGyver.rsDoubleW(context, 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.black45)),
                        child: Center(
                            child: Text(
                          '26',
                          style: GoogleFonts.aBeeZee(
                              fontSize: SizeConfig().textSize(context, 3)),
                        )),
                      ),
                      Container(
                        height: McGyver.rsDoubleH(context, 5),
                        width: McGyver.rsDoubleW(context, 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.black45)),
                        child: Center(
                            child: Text(
                          '03',
                          style: GoogleFonts.aBeeZee(
                              fontSize: SizeConfig().textSize(context, 3)),
                        )),
                      ),
                      Container(
                        height: McGyver.rsDoubleH(context, 5),
                        width: McGyver.rsDoubleW(context, 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.black45)),
                        child: Center(
                            child: Text(
                          '19',
                          style: GoogleFonts.aBeeZee(
                              fontSize: SizeConfig().textSize(context, 3)),
                        )),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 5.5)),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: redColor,
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'To: ',
                      style: GoogleFonts.aBeeZee(
                          fontSize: SizeConfig().textSize(context, 3)),
                    ),
                  ),
                  Text(
                    'Toronto Canada',
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig().textSize(context, 3)),
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 3)),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 30,
                    color: redColor,
                  ),
                  SizedBox(width: McGyver.rsDoubleH(context, 2)),
                  Text(
                    'Date: ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: SizeConfig().textSize(context, 3)),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        height: McGyver.rsDoubleH(context, 5),
                        width: McGyver.rsDoubleW(context, 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.black45)),
                        child: Center(
                            child: Text(
                          '26',
                          style: GoogleFonts.aBeeZee(
                              fontSize: SizeConfig().textSize(context, 3)),
                        )),
                      ),
                      Container(
                        height: McGyver.rsDoubleH(context, 5),
                        width: McGyver.rsDoubleW(context, 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.black45)),
                        child: Center(
                            child: Text(
                          '03',
                          style: GoogleFonts.aBeeZee(
                              fontSize: SizeConfig().textSize(context, 3)),
                        )),
                      ),
                      Container(
                        height: McGyver.rsDoubleH(context, 5),
                        width: McGyver.rsDoubleW(context, 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.black45)),
                        child: Center(
                            child: Text(
                          '19',
                          style: GoogleFonts.aBeeZee(
                              fontSize: SizeConfig().textSize(context, 3)),
                        )),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 3)),
              Text(
                'Total Weight',
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig().textSize(context, 3)),
              ),
              SizedBox(height: McGyver.rsDoubleH(context, 2)),
              Wrap(
                children: [
                  Card(
                    elevation: 10,
                    child: Container(
                      height: McGyver.rsDoubleH(context, 5),
                      width: McGyver.rsDoubleW(context, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 2, color: Colors.black45)),
                      child: Center(
                          child: Text(
                        '1',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3)),
                      )),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: McGyver.rsDoubleH(context, 5),
                      width: McGyver.rsDoubleW(context, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 2, color: Colors.black45)),
                      child: Center(
                          child: Text(
                        '2',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3)),
                      )),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: McGyver.rsDoubleH(context, 5),
                      width: McGyver.rsDoubleW(context, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 2, color: Colors.black45)),
                      child: Center(
                          child: Text(
                        '3',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3)),
                      )),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: McGyver.rsDoubleH(context, 5),
                      width: McGyver.rsDoubleW(context, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 2, color: Colors.black45)),
                      child: Center(
                          child: Text(
                        '4',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3)),
                      )),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: McGyver.rsDoubleH(context, 5),
                      width: McGyver.rsDoubleW(context, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 2, color: Colors.black45)),
                      child: Center(
                          child: Text(
                        '5',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3)),
                      )),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: McGyver.rsDoubleH(context, 5),
                      width: McGyver.rsDoubleW(context, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 2, color: Colors.black45)),
                      child: Center(
                          child: Text(
                        '6',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3)),
                      )),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: McGyver.rsDoubleH(context, 5),
                      width: McGyver.rsDoubleW(context, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 2, color: Colors.black45)),
                      child: Center(
                          child: Text(
                        '7',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3)),
                      )),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: McGyver.rsDoubleH(context, 5),
                      width: McGyver.rsDoubleW(context, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 2, color: Colors.black45)),
                      child: Center(
                          child: Text(
                        '8',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3)),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
