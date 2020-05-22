import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDescription extends StatefulWidget {
  @override
  _OrderDescriptionState createState() => _OrderDescriptionState();
}

class _OrderDescriptionState extends State<OrderDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        title: Text(
          'Order Description',
          style: GoogleFonts.aBeeZee(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Card(
            color: Colors.amber,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Package to be Delivered :',
                              style: GoogleFonts.voces(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                'Bag of Rice',
                                style: GoogleFonts.voces(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Pickup Location :',
                              style: GoogleFonts.voces(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                'Surulere, Lagos',
                                style: GoogleFonts.voces(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton.extended(
                            onPressed: () {}, label: Text('Accept Order')),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
