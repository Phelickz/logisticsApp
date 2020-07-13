import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';

class RequestCards extends StatelessWidget {
  final String url;
  final GestureTapCallback onTap;
  const RequestCards({Key key, this.url, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: Card(
        elevation: 3,
        child: Container(
          // color: Colors.red,
          width: McGyver.rsDoubleW(context, 27),
          height: McGyver.rsDoubleH(context, 13),
          child: Center(
              child: SvgPicture.asset(
            url,
            width: McGyver.rsDoubleW(context, 7),
            height: McGyver.rsDoubleH(context, 7),
          )),
        ),
      ),
    );
  }
}
