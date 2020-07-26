import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import '../screens/payment.dart';

const kGoogleApiKey = "";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _RequestState extends State<Request> {
  bool _visible = false;
  bool _visible2 = false;

  // String _pickUpAddress = '';
  // String _deliveryAddress = '';

  final _formKey = GlobalKey<FormState>();
  TextEditingController _pickUpAdressController = TextEditingController();
  TextEditingController _pickUpFirstNameController = TextEditingController();
  TextEditingController _pickUpLastNameController = TextEditingController();
  TextEditingController _pickUpPhoneController = TextEditingController();
  TextEditingController _pickUpEmailController = TextEditingController();

  TextEditingController _deliveryAdressController = TextEditingController();
  TextEditingController _deliveryFirstNameController = TextEditingController();
  TextEditingController _deliveryLastNameController = TextEditingController();
  TextEditingController _deliveryPhoneController = TextEditingController();
  TextEditingController _deliveryEmailController = TextEditingController();

  // @override
  // void initState(){
  //   _pickUpAdressController.text = this._pickUpAddress;
  //   _deliveryAdressController.text = this._deliveryAddress;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: redColor,
        title: Text(
          'Create a Delivery Task',
          style: GoogleFonts.aBeeZee(
              fontSize: SizeConfig().textSize(context, 3), color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            _visible = !_visible;
                            if (_visible) {
                              setState(() {
                                _visible = true;
                              });
                            } else {
                              setState(() {
                                _visible = false;
                              });
                            }
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Card(
                            // color: Colors.blue,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.add_shopping_cart),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Pick Up Details',
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: SizeConfig().textSize(context, 3),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible == null ? false : _visible,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            onTap: () async {
                              Prediction p = await PlacesAutocomplete.show(
                                  context: context,
                                  apiKey: kGoogleApiKey,
                                  onError: onError,
                                  mode: Mode.overlay, // Mode.fullscreen
                                  language: "en",
                                  components: [
                                    new Component(Component.country, "ng")
                                  ]);
                              displayPrediction(
                                  p, homeScaffoldKey.currentState);
                            },
                            controller: _pickUpAdressController,
                            decoration: InputDecoration(hintText: 'Address'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible == null ? false : _visible,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            controller: _pickUpFirstNameController,
                            decoration: InputDecoration(hintText: 'First Name'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible == null ? false : _visible,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            controller: _pickUpLastNameController,
                            decoration: InputDecoration(hintText: 'Last Name'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible == null ? false : _visible,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            controller: _pickUpPhoneController,
                            decoration: InputDecoration(hintText: 'Phone'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible == null ? false : _visible,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            controller: _pickUpEmailController,
                            decoration: InputDecoration(hintText: 'Email'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _visible2 = !_visible2;
                            if (_visible2) {
                              setState(() {
                                _visible2 = true;
                              });
                            } else {
                              setState(() {
                                _visible2 = false;
                              });
                            }
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Card(
                            // color: Colors.blue,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.local_car_wash),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Delivery Details',
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: SizeConfig().textSize(context, 3),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible2 == null ? false : _visible2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            onTap: ()async {
                              Prediction p = await PlacesAutocomplete.show(
                                  context: context,
                                  apiKey: kGoogleApiKey,
                                  onError: onError,
                                  mode: Mode.overlay, // Mode.fullscreen
                                  language: "en",
                                  components: [
                                    new Component(Component.country, "ng")
                                  ]);
                              displayPrediction(
                                  p, homeScaffoldKey.currentState);
                            },
                            controller: _deliveryAdressController,
                            decoration: InputDecoration(hintText: 'Address'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible2 == null ? false : _visible2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            controller: _deliveryFirstNameController,
                            decoration: InputDecoration(hintText: 'First Name'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible2 == null ? false : _visible2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            controller: _deliveryLastNameController,
                            decoration: InputDecoration(hintText: 'Last Name'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible2 == null ? false : _visible2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            controller: _deliveryPhoneController,
                            decoration: InputDecoration(hintText: 'Phone'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible2 == null ? false : _visible2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                            controller: _deliveryEmailController,
                            decoration: InputDecoration(hintText: 'Email'),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: FloatingActionButton.extended(
                            backgroundColor: redColor,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutMethodCard()));
                              }, label: Text('Proceed to Pay')))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      var placeId = p.placeId;
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);
      scaffold.showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );
    }
  }
}
