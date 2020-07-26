import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/navigation/app_navigation/navigation.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';
import 'package:logistics/services/snackbarService.dart';
import 'package:logistics/services/utils.dart';
import 'package:logistics/services/validator/validator.dart';
// import 'package:logistics/services/utils.dart';
import 'package:logistics/state/authState.dart';
import 'package:logistics/state/providers.dart';
import 'package:logistics/views/authScreen/signup/signup.dart';
import 'package:logistics/views/authScreen/widgets/haveanAccount.dart';
import 'package:logistics/views/authScreen/widgets/input_field.dart';
import 'package:logistics/views/authScreen/widgets/rounded_button.dart';
import 'package:logistics/views/authScreen/widgets/rounded_password.dart';
import 'package:logistics/views/screens/forgotPassword.dart';

import 'package:logistics/views/users/userHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'background.dart';

class Body extends StatefulHookWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final state = useProvider(auth);
    return Background(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text("LOGIN",
              //     style: GoogleFonts.aBeeZee(
              //         fontWeight: FontWeight.bold,
              //         fontSize: SizeConfig().textSize(context, 3))),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/images/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                validator: EmailValidator.validate,
                controller: emailController,
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                controller: passwordController,
                onChanged: (value) {},
                obscure: obscure,
                suffixIcon: IconButton(
                  icon: obscure
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  color: kPrimaryColor,
                ),
              ),
              state.state == AuthState.Busy
                  ? SpinKitThreeBounce(
                      color: redColor,
                      size: 30,
                    )
                  : _button(state, emailController, passwordController),
              SizedBox(height: size.height * 0.01),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: McGyver.rsDoubleW(context, 11)),
                    child: GestureDetector(
                      onTap: () {
                        Navigation().pushTo(context, ForgotPassword());
                      },
                      child: Text('Forgot Password ?',
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig().textSize(context, 2))),
                    ),
                  )),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: SizeConfig().yMargin(context, 3))
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(
      AuthenticationState state,
      TextEditingController emailController,
      TextEditingController passwordController) {
    return Builder(
      builder: ((BuildContext _context) {
        SnackBarService.instance.buildContext = _context;
        return RoundedButton(
          text: "LOGIN",
          press: () {
            final form = _formKey.currentState;

            if (form.validate()) {
              form.save();
              try {
                state
                    .login(emailController.text, passwordController.text)
                    .then((signInUser) async {
                  final uid = await state.currentUserId();
                  if (uid != null) {
                    var something = await Firestore.instance
                        .collection('userData')
                        .document(uid)
                        .get();
                    DocumentSnapshot doc = something;
                    if (doc['status'] == 'rider') {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString('status', doc['status']);
                      gotoRiderHomeScreen(context, state);
                    } else {
                      gotoHomeScreen(context, state);
                    }
                  } else {
                    print('User is null');
                  }
                });
              } catch (e) {
                print(e);
              }
            }
          },
        );
      }),
    );
  }
}
