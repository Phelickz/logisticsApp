import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:logistics/state/authState.dart';
import 'package:logistics/views/riders/pedingOrdersDescription.dart';
import 'package:provider/provider.dart';

class RidersHome extends KFDrawerContent {
  RidersHome({
    Key key,
  });

  @override
  _RidersHomeState createState() => _RidersHomeState();
}

class _RidersHomeState extends State<RidersHome> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blueGrey[900],
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: widget.onMenuPressed,
                      ),
                    ),
                  ),
                  Text('Pending Orders',
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: Container(color: Colors.blueGrey[900]),
            ),
            Container(
              width: width,
              height: height * 1,
              color: Colors.blueGrey[900],
              child: StreamBuilder(
                  stream: getUsersDataSnapshots(context),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? snapshot.data.documents.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  var item = snapshot.data.documents[index];
                                  return Container(
                                    margin: EdgeInsets.only(left: 15),
                                    padding: EdgeInsets.only(bottom: 100,),
                                    decoration: BoxDecoration(
                                        // color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    width: width * 0.9,
                                    height: height * 0.8,
                                    child: Card(
                                      color: Colors.orange[500],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                CircleAvatar(
                                                  backgroundColor: Colors.black,
                                                  radius: 28,
                                                  child: Icon(
                                                    Icons.shopping_cart,
                                                    size: 30,
                                                    color: Colors
                                                        .yellowAccent[700],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 18.0),
                                                  child: Text(
                                                    '#' +
                                                        item['pickupPhone']
                                                            .toString(),
                                                    style: GoogleFonts.aBeeZee(
                                                        fontSize: 20),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Divider(
                                              thickness: 2,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Order requested by ' +
                                                  item['pickupFirstname'],
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 28,
                                                  child: Icon(
                                                    Icons.location_on,
                                                    size: 30,
                                                    color: Colors
                                                        .yellowAccent[700],
                                                  ),
                                                  backgroundColor: Colors.black,
                                                ),
                                                SizedBox(width: 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'From: ',
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 18),
                                                    ),
                                                    Text(
                                                      item['pickupAddress'],
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 20),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 28,
                                                  child: Icon(
                                                    Icons.home,
                                                    size: 30,
                                                    color: Colors
                                                        .yellowAccent[700],
                                                  ),
                                                  backgroundColor: Colors.black,
                                                ),
                                                SizedBox(width: 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'To: ',
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 18),
                                                    ),
                                                    Text(
                                                      item['deliveryAddress'],
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 20),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Divider(thickness: 2),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 28,
                                                  child: Icon(
                                                    Icons.account_circle,
                                                    size: 30,
                                                    color: Colors
                                                        .yellowAccent[700],
                                                  ),
                                                  backgroundColor: Colors.black,
                                                ),
                                                SizedBox(width: 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Client's info: ",
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 18),
                                                    ),
                                                    Text(
                                                      item['pickupFirstname'] +
                                                          " " +
                                                          item[
                                                              'pickupLastname'],
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 20),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 30),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Container(
                                                width: width * 0.7,
                                                child: FloatingActionButton
                                                    .extended(
                                                        heroTag: 'btn55'+index.toString(),
                                                        backgroundColor:
                                                            Colors.black,
                                                        icon: Icon(Icons.phone),
                                                        onPressed: () {},
                                                        label: Text("Call " +
                                                            item[
                                                                'pickupFirstname'])),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Divider(thickness: 2),
                                            SizedBox(height: 40),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Container(
                                                width: width * 0.7,
                                                child: FloatingActionButton
                                                    .extended(
                                                        heroTag: 'btn22'+index.toString(),
                                                        backgroundColor:
                                                            Colors.black,
                                                        icon: Icon(
                                                            Icons.motorcycle),
                                                        onPressed: () {},
                                                        label:
                                                            Text('Take Order')),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : Center(child: Text('No new orders'))
                        : Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Stream<QuerySnapshot> getUsersDataSnapshots(BuildContext context) async* {
    final uid = await Provider.of<AuthenticationState>(context, listen: false)
        .currentUserId();
    yield* _firestore
        .collection('orders')
        .where('status', isEqualTo: 'requested')
        .snapshots();
  }
}
