import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/animation/animations.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/models.dart';
import 'package:logistics/services/navigation/app_navigation/navigation.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';
import 'package:logistics/state/authState.dart';
import 'package:logistics/views/screens/request.dart';
import 'package:logistics/views/users/addOrder.dart';
import 'package:logistics/views/widgets/homecards.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'chart.dart';
import 'sidebar/sidebar_layout.dart';

final data = [55.0, 90.0, 50.0, 40.0, 35.0, 55.0, 70.0, 100.0];

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Firestore _firestore = Firestore.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String username;
  String name;
  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      setState(() {
        this.username = user.uid;
        this.name = user.displayName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        endDrawer: FadeIn(delay: 0.5, child: SidebarLayout()),
        // appBar: AppBar(
        //   leading: Icon(Icons.dashboard),
        //   elevation: 0,
        //   title: Text(
        //     this.name ?? '',
        //     style: GoogleFonts.aBeeZee(
        //         color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),
        //   ),
        //   centerTitle: false,
        //   backgroundColor: redColor,
        // ),
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFFe74c3c),
            child: Icon(Icons.add),
            onPressed: () => Get.to(Request())),
        body: Column(children: [
          Container(
            // color: Colors.amber,
            width: width,
            height: McGyver.rsDoubleH(context, 40),
            child: Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/L2.jpg'))),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFe74c3c),
                          Color(0xFFe74c3c),
                          Color(0xFF000000),
                          // Color(0xFFB6BAA6),
                        ],
                        // stops: [
                        //   0.5,
                        //   0.4,
                        //   0.1,
                        // ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: width,
                  height: McGyver.rsDoubleH(context, 10),
                  child: AppBar(
                    leading: Icon(Icons.dashboard),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      'EML Logistics',
                      style: GoogleFonts.aBeeZee(
                          fontSize: SizeConfig().textSize(context, 3),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Text(
                    'Hello, ${name ?? ''}',
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: SizeConfig().textSize(context, 3)),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Wrap(
                spacing: McGyver.rsDoubleW(context, 10),
                runSpacing: McGyver.rsDoubleW(context, 10),
                children: [
                  HomeCards(
                    url: 'assets/images/truck.svg',
                    text: "Ship Now",
                    onTap: () {Navigation().pushTo(context, AddOrder());}
                  ),
                  HomeCards(
                    url: 'assets/images/airplane (2).svg',
                    text: "Ship Now",
                  ),
                  HomeCards(
                    url: 'assets/images/price.svg',
                    text: "See Prices",
                  ),
                  HomeCards(
                    url: 'assets/images/phone.svg',
                    text: "Contact Us",
                  )
                ],
              ),
            ),
          )
        ]));
    // return Consumer<AuthenticationState>(
    //   builder: (context, authState, child) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         leading: Icon(Icons.dashboard),
    //         elevation: 0,
    //         title: Text(this.name ?? '', style: GoogleFonts.aBeeZee(
    //           color: Colors.white,
    //           fontWeight: FontWeight.w800,
    //           fontSize: 20
    //         ),),
    //         centerTitle: false,
    //         backgroundColor: redColor,
    //       ),
    //       backgroundColor: Colors.white,
    //       key: _scaffoldKey,
    //       floatingActionButton: FloatingActionButton(
    //           backgroundColor: Color(0xFFe74c3c),
    //           child: Icon(Icons.add),
    //           onPressed: () => Get.to(Request())),
    //       body: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             SizedBox(
    //               height: 10,
    //             ),
    //             Container(
    //               margin: EdgeInsets.symmetric(horizontal: 8),
    //               width: width,
    //               height: height * 0.8,
    //               child: StreamBuilder(
    //                   stream: getUsersDataSnapshots(context),
    //                   builder: (context, snapshot) {
    //                     return snapshot.hasData
    //                         ? snapshot.data.documents.isNotEmpty
    //                             ? ListView.builder(
    //                                 itemCount: snapshot.data.documents.length,
    //                                 itemBuilder: (context, index) {
    //                                   var item =
    //                                       snapshot.data.documents[index];
    //                                   return Container(
    //                                     height: height * 0.27,
    //                                     width: width * 0.98,
    //                                     decoration: BoxDecoration(
    //                                         // color: Colors.red,

    //                                         borderRadius:
    //                                             BorderRadius.circular(20)),
    //                                     child: Card(
    //                                         elevation: 10,
    //                                         shape: RoundedRectangleBorder(
    //                                             borderRadius:
    //                                                 BorderRadius.circular(
    //                                                     20)),
    //                                         child: Container(
    //                                           decoration: BoxDecoration(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(
    //                                                       20),
    //                                               // shape: BoxShape.circle,
    //                                               color: Colors.grey[200]),
    //                                           child: Column(
    //                                             crossAxisAlignment:
    //                                                 CrossAxisAlignment.start,
    //                                             children: <Widget>[
    //                                               Container(
    //                                                 height: 45,
    //                                                 decoration: BoxDecoration(
    //                                                     color:
    //                                                         Colors.green[800],
    //                                                     borderRadius:
    //                                                         BorderRadius
    //                                                             .circular(
    //                                                                 10)),
    //                                                 width: width * 0.98,
    //                                                 child: Padding(
    //                                                   padding:
    //                                                       const EdgeInsets
    //                                                               .symmetric(
    //                                                           horizontal:
    //                                                               8.0),
    //                                                   child: Row(
    //                                                     mainAxisAlignment:
    //                                                         MainAxisAlignment
    //                                                             .spaceBetween,
    //                                                     children: <Widget>[
    //                                                       Text(
    //                                                         '#' +
    //                                                             item['pickupPhone']
    //                                                                 .toString(),
    //                                                         style: GoogleFonts.aBeeZee(
    //                                                             fontSize: 20,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w800),
    //                                                       ),
    //                                                       Text(
    //                                                         timeago
    //                                                             .format(item[
    //                                                                     'timestamp']
    //                                                                 .toDate())
    //                                                             .toString(),
    //                                                         style: GoogleFonts.aBeeZee(
    //                                                             fontSize: 20,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w500),
    //                                                       )
    //                                                     ],
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               Padding(
    //                                                 padding: const EdgeInsets
    //                                                         .symmetric(
    //                                                     horizontal: 8.0),
    //                                                 child: Row(
    //                                                   mainAxisAlignment:
    //                                                       MainAxisAlignment
    //                                                           .spaceBetween,
    //                                                   children: <Widget>[
    //                                                     Padding(
    //                                                       padding:
    //                                                           const EdgeInsets
    //                                                                   .symmetric(
    //                                                               vertical:
    //                                                                   8.0),
    //                                                       child: Column(
    //                                                         crossAxisAlignment:
    //                                                             CrossAxisAlignment
    //                                                                 .start,
    //                                                         children: <
    //                                                             Widget>[
    //                                                           Container(
    //                                                               height: 30,
    //                                                               width: 130,
    //                                                               decoration: BoxDecoration(
    //                                                                   color: Colors.green[
    //                                                                       200],
    //                                                                   borderRadius:
    //                                                                       BorderRadius.circular(
    //                                                                           10)),
    //                                                               child:
    //                                                                   Center(
    //                                                                 child: Text(
    //                                                                     'Pickup adddress',
    //                                                                     style: GoogleFonts.aBeeZee(
    //                                                                         fontSize: 15,
    //                                                                         fontWeight: FontWeight.bold)),
    //                                                               )),
    //                                                           SizedBox(
    //                                                               height: 10),
    //                                                           Text(
    //                                                             item[
    //                                                                 'pickupAddress'],
    //                                                             style: GoogleFonts.aBeeZee(
    //                                                                 fontSize:
    //                                                                     20,
    //                                                                 fontWeight:
    //                                                                     FontWeight
    //                                                                         .w500),
    //                                                           ),
    //                                                           SizedBox(
    //                                                               height: 30),
    //                                                           Text(
    //                                                             'Status: ' +
    //                                                                 item[
    //                                                                     'status'],
    //                                                             style: GoogleFonts.aBeeZee(
    //                                                                 fontSize:
    //                                                                     20,
    //                                                                 fontWeight:
    //                                                                     FontWeight
    //                                                                         .w500),
    //                                                           )
    //                                                         ],
    //                                                       ),
    //                                                     ),
    //                                                     Column(
    //                                                       crossAxisAlignment:
    //                                                           CrossAxisAlignment
    //                                                               .start,
    //                                                       children: <Widget>[
    //                                                         Container(
    //                                                             height: 30,
    //                                                             width: 130,
    //                                                             decoration: BoxDecoration(
    //                                                                 color: Colors
    //                                                                         .green[
    //                                                                     200],
    //                                                                 borderRadius:
    //                                                                     BorderRadius.circular(
    //                                                                         10)),
    //                                                             child: Center(
    //                                                               child: Text(
    //                                                                   'Dropoff adddress',
    //                                                                   style: GoogleFonts.aBeeZee(
    //                                                                       fontSize:
    //                                                                           15,
    //                                                                       fontWeight:
    //                                                                           FontWeight.bold)),
    //                                                             )),
    //                                                         SizedBox(
    //                                                             height: 10),
    //                                                         Text(
    //                                                           item[
    //                                                               'deliveryAddress'],
    //                                                           style: GoogleFonts.aBeeZee(
    //                                                               fontSize:
    //                                                                   20,
    //                                                               fontWeight:
    //                                                                   FontWeight
    //                                                                       .w500),
    //                                                         ),
    //                                                         SizedBox(
    //                                                             height: 30),
    //                                                         Text(
    //                                                           'Receiver: ' +
    //                                                               item[
    //                                                                   'deliveryFirstname'],
    //                                                           style: GoogleFonts.aBeeZee(
    //                                                               fontSize:
    //                                                                   20,
    //                                                               fontWeight:
    //                                                                   FontWeight
    //                                                                       .w500),
    //                                                         )
    //                                                       ],
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               )
    //                                             ],
    //                                           ),
    //                                         )),
    //                                   );
    //                                 },
    //                               )
    //                             : Center(
    //                                 child: Text(snapshot.data.documents.length
    //                                         .toString() +
    //                                     ' new orders'),
    //                               )
    //                         : Center(child: CircularProgressIndicator());
    //                   }),
    //             ),
    //           ],
    //         ),
    //       ),
    //       endDrawer: FadeIn(
    //         delay: 0.5,
    //         child: SidebarLayout()),
    //     );
    //   },
    // );
  }

  Stream<QuerySnapshot> getUsersDataSnapshots(BuildContext context) async* {
    final uid = await Provider.of<AuthenticationState>(context, listen: false)
        .currentUserId();
    yield* _firestore
        .collection('orders')
        .where('userID', isEqualTo: uid)
        .where('status', isEqualTo: 'requested')
        .snapshots();
  }
}
