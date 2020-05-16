



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:logistics/views/riders/completed.dart';
import 'package:logistics/views/riders/inProgress.dart';
import 'package:logistics/views/riders/mainRider.dart';
import 'package:logistics/views/riders/profile.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: RidersHome(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Pending', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: RidersHome(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'In Progress',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.directions_bike, color: Colors.white),
          page: RidersProgress(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Completed',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.done, color: Colors.white),
          page: RidersCompleted(),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text('Logistics', style: TextStyle(fontSize: 20),),
            // child: Image.asset(
            //   'assets/logo.png',
            //   alignment: Alignment.centerLeft,
            // ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return RidersProfile();
              },
            ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffc33764), Color(0xff1d2671)],
            
            // colors: [Color.fromRGBO(255, 255, 255, 1.0), Color.fromRGBO(44, 72, 171, 1.0)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}




typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<RidersHome>(() => RidersHome());
    register<RidersProgress>(() => RidersProgress());
    register<RidersCompleted>(() => RidersCompleted());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }}