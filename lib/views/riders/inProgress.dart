import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class RidersProgress extends KFDrawerContent {
  RidersProgress({
    Key key,
  });

  @override
  _RidersProgressState createState() => _RidersProgressState();
}

class _RidersProgressState extends State<RidersProgress> {
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
                  'In Progress',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Your active orders will appear here'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}