import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class RidersCompleted extends KFDrawerContent {
  RidersCompleted({
    Key key,
  });

  @override
  _RidersCompletedState createState() => _RidersCompletedState();
}
class _RidersCompletedState extends State<RidersCompleted> {
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
                  'Completed Orders',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Your Completed Orders will appear here'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}