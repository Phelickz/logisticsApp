import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:logistics/services/auth.dart';
import 'package:logistics/state/authState.dart';
import 'package:provider/provider.dart';

class RidersCompleted extends KFDrawerContent {
  RidersCompleted({
    Key key,
  });

  @override
  _RidersCompletedState createState() => _RidersCompletedState();
}

class _RidersCompletedState extends State<RidersCompleted> {
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
              color: Colors.blueGrey[800],
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
                    'Completed Orders',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                height: height,
                color: Colors.blueGrey[800],
                child: StreamBuilder(
                    stream: getUsersDataSnapshots(context),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? snapshot.data.documents.isNotEmpty
                              ? ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index){
                                  var _item =  snapshot.data.documents[index];
                                  return Container();
                                })
                              : Center(
                                  child: Text('You have 0 completed orders'))
                          : Center(child: CircularProgressIndicator());
                    })),
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
        .where('riderUid', isEqualTo: uid)
        .where('status', isEqualTo: 'completed')
        .snapshots();
  }
}
