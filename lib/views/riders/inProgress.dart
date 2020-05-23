import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:logistics/services/auth.dart';
import 'package:logistics/state/authState.dart';
import 'package:provider/provider.dart';

class RidersProgress extends KFDrawerContent {
  RidersProgress({
    Key key,
  });

  @override
  _RidersProgressState createState() => _RidersProgressState();
}

class _RidersProgressState extends State<RidersProgress> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height * 0.4,
              color: Colors.blueGrey[900],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: height * 0.59,
                color: Colors.orange[500],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
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
                          color: Colors.black,
                        ),
                        onPressed: widget.onMenuPressed,
                      ),
                    ),
                  ),
                  Text(
                    'Active Deliveries',
                    style: TextStyle(
                        color: Colors.orange[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Positioned(
              top: height * 0.15,
              child: Container(
                width: width,
                height: height,
                // color: Colors.red,
                child: StreamBuilder(
                    stream: getUsersDataSnapshots(context),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? snapshot.data.documents.isNotEmpty
                              ? ListView.builder(
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (context, index) {
                                    var _item = snapshot.data.documents[index];
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: width * 0.6,
                                      height: height * 0.7,
                                      child: Card(
                                        color: Colors.white70,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text(
                                                  "Order #" +
                                                      _item['deliveryPhone']
                                                          .toString(),
                                                  style: GoogleFonts.aBeeZee(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text(
                                                  "Status: Not Started",
                                                  style: GoogleFonts.aBeeZee(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Divider(
                                                thickness: 2,
                                                color: Colors.orange[700],
                                              ),
                                              SizedBox(height: 20),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text(
                                                  "PickUp Location: " +
                                                      _item['pickupAddress'],
                                                  style: GoogleFonts.aBeeZee(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text(
                                                  "Sender: " +
                                                      _item['pickupFirstname'],
                                                  style: GoogleFonts.aBeeZee(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  _button(
                                                      true, "Message", "btn1"),
                                                  _button(false, "Call", "btn2")
                                                ],
                                              ),
                                              SizedBox(height: 45),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text(
                                                  "Drop-Off Location: " +
                                                      _item['deliveryAddress'],
                                                  style: GoogleFonts.aBeeZee(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text(
                                                  "Receiver: " +
                                                      _item[
                                                          'deliveryFirstname'],
                                                  style: GoogleFonts.aBeeZee(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  _button(
                                                      true, "Message", "btn3"),
                                                  _button(false, "Call", "btn4")
                                                ],
                                              ),
                                              SizedBox(height: 40),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 81.0),
                                                child: FloatingActionButton.extended(
                                                  backgroundColor: Colors.green,
                                                  icon: Icon(Icons.motorcycle),
                                                  heroTag: "btn5",
                                                  onPressed: null, 
                                                  label: Text('Start delivery')),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Center(child: Text('You have no active orders'))
                          : CircularProgressIndicator();
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _button(bool isMessage, String type, String tag) {
    return Container(
      width: 130,
      child: FloatingActionButton.extended(
          backgroundColor: Colors.orange[700],
          heroTag: tag,
          icon: isMessage
              ? Icon(
                  Icons.message,
                  color: Colors.blueGrey[800],
                )
              : Icon(
                  Icons.phone,
                  color: Colors.blueGrey[800],
                ),
          onPressed: null,
          label: Text(
            type,
            style: TextStyle(
              color: Colors.blueGrey[800],
            ),
          )),
    );
  }

  Stream<QuerySnapshot> getUsersDataSnapshots(BuildContext context) async* {
    final uid = await Provider.of<AuthenticationState>(context, listen: false)
        .currentUserId();
    yield* _firestore
        .collection('orders')
        .where('riderUid', isEqualTo: uid)
        .where('status', isEqualTo: 'inProgress')
        .snapshots();
  }
}
