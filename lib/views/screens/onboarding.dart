import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/views/screens/button.dart';
import 'package:logistics/views/screens/category.dart';
import 'package:logistics/views/screens/login.dart';


class Onboarding extends StatefulWidget {
  Onboarding({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OnboardingState createState() => new _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  //Create a list of PageModel to be set on the onBoarding Screens.
  final pageList = [
    PageModel(
        color: const Color(0xFFF81530),
        heroAssetPath: 'assets/images/undraw_deliveries_131a.svg',
        title: Text('Bulk Delivery',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('We are capable of handling bulk deliveries. So you don\'t have to worry about size',
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/images/open.svg'
        ),
    PageModel(
        color: const Color(0xFFA91001),
        heroAssetPath: 'assets/images/undraw_takeout_boxes_ap54 (1).svg',
        title: Text('Door Delivery',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'No need coming over to our stations. We bring our services to your doorstep',
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/images/truck.svg'),
    PageModel(
      color: const Color(0xFFE8643C),
      heroAssetPath: 'assets/images/undraw_on_the_way_ldaq (1).svg',
      title: Text('Fast Delivery',
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )
          ),
      body: Text('There is a delivery option for every package size',
          textAlign: TextAlign.center,
          style: GoogleFonts.aBeeZee(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/images/airplane (2).svg',
    ),
    // SVG Pages Example
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonText: "Proceed",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Get.off(Category()),
        onSkipButtonPressed: () =>
            Get.off(Category()),
      ),
    );
  }
}
