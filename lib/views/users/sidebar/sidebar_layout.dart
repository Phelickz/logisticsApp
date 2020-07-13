import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';
import 'package:logistics/services/utils.dart';
import 'package:logistics/state/authState.dart';
import 'package:logistics/views/riders/pedingOrdersDescription.dart';
import 'package:logistics/views/screens/request.dart';
import 'package:logistics/views/users/completedOrders.dart';
import 'package:logistics/views/users/profile..dart';
import 'package:provider/provider.dart';
import '../activeOrders.dart';
import 'sidebar_item.dart';

class SidebarLayout extends StatefulWidget {
  @override
  _SidebarLayoutState createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> with AfterLayoutMixin {
  int selectedIndex = 0;
  LabeledGlobalKey _walletKey = LabeledGlobalKey("walletKey");
  LabeledGlobalKey _restaurantKey = LabeledGlobalKey("restaurantKey");
  LabeledGlobalKey _myCartKey = LabeledGlobalKey("myCardKey");
  LabeledGlobalKey _myProfileKey = LabeledGlobalKey("myProfileKey");

  RenderBox renderBox;
  double startYPosition;

  void onTabTap(int index) {
    setState(() {
      selectedIndex = index;
      switch (selectedIndex) {
        case 0:
          renderBox = _walletKey.currentContext.findRenderObject();
          break;
        case 1:
          renderBox = _restaurantKey.currentContext.findRenderObject();
          break;
        case 2:
          renderBox = _myCartKey.currentContext.findRenderObject();
          break;
        case 3:
          renderBox = _myProfileKey.currentContext.findRenderObject();
          break;
      }

      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          width: McGyver.rsDoubleW(context, 28),
          top: 0,
          bottom: 0,
          right: 0,
          child: ClipPath(
            clipper: SidebarClipper(
              (startYPosition == null) ? 0 : startYPosition - 170,
              (startYPosition == null) ? 0 : startYPosition - 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF000000),
                    Color(0xFFe74c3c),
                    Color(0xFFe74c3c),
                    // Color(0xFFFF57AC),
                    // Color(0xFFFF6D91),
                    // Color(0xFFFF8D7E),
                    // Color(0xFFB6BAA6),
                  ],
                  stops: [0.05, 0.3, 0.5,],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -(McGyver.rsDoubleW(context, 6.4)),
          top: 0,
          bottom: 0,
          child: Column(
            children: [
              SizedBox(
                height: McGyver.rsDoubleH(context, 6),
              ),
              InkWell(
                onTap: ()async{
                  final _auth = Provider.of<AuthenticationState>(context, listen: false);
                  await _auth.logout();
                  gotoLoginScreen(context);
                },
                              child: Icon(
                  Icons.settings_applications,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 13),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SidebarItem(
                      key: _walletKey,
                      text: "Home",
                      onTabTap: () {
                        onTabTap(0);
                      },
                      isSelected: selectedIndex == 0,
                    ),
                    SidebarItem(
                      key: _restaurantKey,
                      text: "Active",
                      onTabTap: () {
                        onTabTap(1);
                        Get.to(ActiveOrders());
                      },
                      isSelected: selectedIndex == 1,
                    ),
                    SidebarItem(
                      key: _myCartKey,
                      text: "Completed",
                      onTabTap: () {
                        onTabTap(2);
                        Get.to(CompletedOrders());
                      },
                      isSelected: selectedIndex == 2,
                    ),
                    SidebarItem(
                      key: _myProfileKey,
                      text: "Profile",
                      onTabTap: () {
                        onTabTap(3);
                        Get.to(UserProfile());
                      },
                      isSelected: selectedIndex == 3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 10),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      renderBox = _walletKey.currentContext.findRenderObject();
      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }
}

class SidebarClipper extends CustomClipper<Path> {
  final double startYPosition, endYPosition;

  SidebarClipper(this.startYPosition, this.endYPosition);

  @override
  Path getClip(Size size) {
    Path path = Path();

    double width = size.width;
    double height = size.height;

    //up curve
    path.moveTo(width, 0);
    path.quadraticBezierTo(width / 3, 5, width / 3, 70);

    //custom curve
    // path.lineTo(width / 3, startYPosition);
    // path.quadraticBezierTo(width / 3 - 2, startYPosition + 15, width / 3 - 10,
    //     startYPosition + 25);
    // path.quadraticBezierTo(0, startYPosition + 55, 3, startYPosition + 60);
    // path.quadraticBezierTo(
    //     0, endYPosition - 65, width / 3 - 5, endYPosition - 25);
    // path.quadraticBezierTo(
    //     width / 3 - 2, endYPosition - 15, width / 3, endYPosition);

    // //down curve
    path.lineTo(width / 3, height - 70);
    path.quadraticBezierTo(width / 3, height - 5, width, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
