import 'package:flutter/material.dart';

import 'userHome.dart';


class CompletedOrders extends StatefulWidget {
  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            }),
      ),
      body: Center(child: Text('Your completed orders will appear here')),
    );
  }
}