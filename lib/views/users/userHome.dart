import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/screens/request.dart';
import 'package:logistics/services/models.dart';
import 'package:logistics/state/authState.dart';
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

    return Consumer<AuthenticationState>(
      builder: (context, authState, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              elevation: 0,
              title: Text(this.name, style: GoogleFonts.aBeeZee(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 20
              ),),
              centerTitle: true,
              backgroundColor: Colors.blueGrey[800],
            ),
            backgroundColor: Colors.blueGrey[800],
            key: _scaffoldKey,
            floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xFFCF5CCF),
                child: Icon(Icons.open_in_new),
                onPressed: _openEndDrawer),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   child: Container(
                  //       child: Text(
                  //     'Hello, ' + this.name,
                  //     style: GoogleFonts.aBeeZee(
                  //         fontSize: 30, fontWeight: FontWeight.w800),
                  //   )),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: width,
                    height: height * 0.8,
                    child: StreamBuilder(
                        stream: getUsersDataSnapshots(context),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? snapshot.data.documents.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: snapshot.data.documents.length,
                                      itemBuilder: (context, index) {
                                        var item =
                                            snapshot.data.documents[index];
                                        return Container(
                                          height: height * 0.27,
                                          width: width * 0.98,
                                          decoration: BoxDecoration(
                                              // color: Colors.red,

                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    // shape: BoxShape.circle,
                                                    color: Colors.grey[200]),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.green[800],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      width: width * 0.98,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Text(
                                                              '#' +
                                                                  item['pickupPhone']
                                                                      .toString(),
                                                              style: GoogleFonts.aBeeZee(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                            ),
                                                            Text(
                                                              timeago
                                                                  .format(item[
                                                                          'timestamp']
                                                                      .toDate())
                                                                  .toString(),
                                                              style: GoogleFonts.aBeeZee(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                    height: 30,
                                                                    width: 130,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.green[
                                                                            200],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10)),
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          'Pickup adddress',
                                                                          style: GoogleFonts.aBeeZee(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold)),
                                                                    )),
                                                                SizedBox(
                                                                    height: 10),
                                                                Text(
                                                                  item[
                                                                      'pickupAddress'],
                                                                  style: GoogleFonts.aBeeZee(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                    height: 30),
                                                                Text(
                                                                  'Status: ' +
                                                                      item[
                                                                          'status'],
                                                                  style: GoogleFonts.aBeeZee(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Container(
                                                                  height: 30,
                                                                  width: 130,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                              .green[
                                                                          200],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Center(
                                                                    child: Text(
                                                                        'Dropoff adddress',
                                                                        style: GoogleFonts.aBeeZee(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                  )),
                                                              SizedBox(
                                                                  height: 10),
                                                              Text(
                                                                item[
                                                                    'deliveryAddress'],
                                                                style: GoogleFonts.aBeeZee(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              SizedBox(
                                                                  height: 30),
                                                              Text(
                                                                'Receiver: ' +
                                                                    item[
                                                                        'deliveryFirstname'],
                                                                style: GoogleFonts.aBeeZee(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        );
                                      },
                                    )
                                  : Center(
                                      child: Text(snapshot.data.documents.length
                                              .toString() +
                                          ' new orders'),
                                    )
                              : Center(child: CircularProgressIndicator());
                        }),
                  ),
                ],
              ),
            ),
            endDrawer: SidebarLayout(),
          ),
        );
      },
    );
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

// Widget build(BuildContext context) {
//   double width = MediaQuery.of(context).size.width;

//   return Scaffold(
//     key: _scaffoldKey,
//     floatingActionButton: FloatingActionButton(
//         backgroundColor: Color(0xFFCF5CCF),
//         child: Icon(Icons.open_in_new),
//         onPressed: _openEndDrawer),
//     body: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 60,
//               ),
//               Text(
//                 "Hello!",
//                 style: TextStyle(fontSize: 24, color: Colors.black),
//               ),
//               Text(
//                 username ?? '',
//                 style: TextStyle(
//                   fontSize: 26,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Center(
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                             builder: (context) => Request()));
//                   },
//                   child: ClayContainer(
//                     height: 300,
//                     width: width * 0.8,
//                     depth: 12,
//                     spread: 12,
//                     borderRadius: 16,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 16.0,
//                             right: 16,
//                             top: 16,
//                           ),
//                           child: Text(
//                             "Total Balance",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16.0,
//                           ),
//                           child: Text(
//                             "425,04€",
//                             style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w900,
//                                 color: Colors.black),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Chart(
//                           data: data,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   ClayContainer(
//                     height: 180,
//                     width: width * 0.35,
//                     emboss: true,
//                     borderRadius: 16,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 16.0,
//                             right: 16,
//                             top: 16,
//                           ),
//                           child: Text(
//                             "Balance for today",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w900,
//                               color: Colors.black45,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16.0,
//                           ),
//                           child: Text(
//                             "19,00€",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w900,
//                               color: Colors.black45,
//                             ),
//                           ),
//                         ),
//                         Spacer(),
//                         Container(
//                           margin: const EdgeInsets.only(
//                             bottom: 16,
//                             left: 16,
//                             right: 16,
//                           ),
//                           height: 10,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.black45,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   ClayContainer(
//                     height: 180,
//                     width: width * 0.35,
//                     borderRadius: 16,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 16.0,
//                             right: 16,
//                             top: 16,
//                           ),
//                           child: Text(
//                             "Unlock the limit of 19£",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w900,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16.0,
//                           ),
//                           child: Text(
//                             "By linking your bank card",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black45,
//                             ),
//                           ),
//                         ),
//                         Spacer(),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Container(
//                             margin:
//                                 const EdgeInsets.only(bottom: 16, right: 16),
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color(0xFFFF559F),
//                                   Color(0xFFCF5CCF),
//                                   Color(0xFFFF57AC),
//                                   Color(0xFFFF6D91),
//                                   Color(0xFFFF8D7E),
//                                   Color(0xFFB6BAA6),
//                                 ],
//                               ),
//                             ),
//                             child: Icon(
//                               Icons.arrow_forward,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       "March 2020",
//                       style: TextStyle(
//                         color: Colors.black45,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     Text(
//                       "-52,30£",
//                       style: TextStyle(
//                         color: Colors.black45,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 children: <Widget>[
//                   ListTile(
//                     leading: ClayContainer(
//                       width: 40,
//                       height: 40,
//                       borderRadius: 8,
//                       child: ShaderMask(
//                         shaderCallback: (Rect bounds) {
//                           return LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [
//                                 Color(0xFFFF559F),
//                                 Color(0xFFCF5CCF),
//                                 Color(0xFFFF57AC),
//                                 Color(0xFFFF6D91),
//                                 Color(0xFFFF8D7E),
//                                 Color(0xFFB6BAA6),
//                               ]).createShader(bounds);
//                         },
//                         blendMode: BlendMode.srcATop,
//                         child: Icon(
//                           Icons.local_pizza,
//                           color: Colors.red,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       "Sc Boul Andre",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     subtitle: Text(
//                       "12 March 13:43",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     trailing: Text("-9.20£",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                         )),
//                   ),
//                   ListTile(
//                     leading: ClayContainer(
//                       width: 40,
//                       height: 40,
//                       borderRadius: 8,
//                       child: ShaderMask(
//                         shaderCallback: (Rect bounds) {
//                           return LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [
//                                 Color(0xFFFF559F),
//                                 Color(0xFFCF5CCF),
//                                 Color(0xFFFF57AC),
//                                 Color(0xFFFF6D91),
//                                 Color(0xFFFF8D7E),
//                                 Color(0xFFB6BAA6),
//                               ]).createShader(bounds);
//                         },
//                         blendMode: BlendMode.srcATop,
//                         child: Icon(
//                           Icons.local_pizza,
//                           color: Colors.red,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       "Sc Boul Andre",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     subtitle: Text(
//                       "12 March 13:43",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     trailing: Text("-9.20£",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                         )),
//                   ),
//                   ListTile(
//                     leading: ClayContainer(
//                       width: 40,
//                       height: 40,
//                       borderRadius: 8,
//                       child: ShaderMask(
//                         shaderCallback: (Rect bounds) {
//                           return LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [
//                                 Color(0xFFFF559F),
//                                 Color(0xFFCF5CCF),
//                                 Color(0xFFFF57AC),
//                                 Color(0xFFFF6D91),
//                                 Color(0xFFFF8D7E),
//                                 Color(0xFFB6BAA6),
//                               ]).createShader(bounds);
//                         },
//                         blendMode: BlendMode.srcATop,
//                         child: Icon(
//                           Icons.local_pizza,
//                           color: Colors.red,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       "Sc Boul Andre",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     subtitle: Text(
//                       "12 March 13:43",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     trailing: Text("-9.20£",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w900,
//                         )),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     endDrawer: SidebarLayout(),
//   );
// }