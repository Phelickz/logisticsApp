import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:logistics/views/riders/pedingOrdersDescription.dart';

class RidersHome extends KFDrawerContent {
  RidersHome({
    Key key,
  });

  @override
  _RidersHomeState createState() => _RidersHomeState();
}

class _RidersHomeState extends State<RidersHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
                Text(
                  'Pending Orders',
                  style: GoogleFonts.pacifico(
                    fontSize: 20, fontWeight: FontWeight.bold
                  )
                )
              ],
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDescription()));
                  },
                  child: Card(
                    color: Colors.brown,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Edobor Newman',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text(
                                'Pickup Location: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Surulere, Lagos',
                                style: GoogleFonts.satisfy(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Delivery Location: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Ikeja, Lagos',
                                style: GoogleFonts.satisfy(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Something'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Something'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Something'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Something'),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
