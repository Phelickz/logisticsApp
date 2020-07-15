import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/snackbarService.dart';
import 'package:logistics/services/utils.dart';
import 'package:logistics/services/validator/validator.dart';
import 'package:logistics/state/authState.dart';
import 'package:logistics/state/providers.dart';
import 'package:logistics/views/authScreen/login/login.dart';
import 'package:logistics/views/authScreen/widgets/haveanAccount.dart';
import 'package:logistics/views/authScreen/widgets/input_field.dart';
import 'package:logistics/views/authScreen/widgets/rounded_button.dart';
import 'package:logistics/views/authScreen/widgets/rounded_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'background.dart';
import 'div.dart';
import 'socIcon.dart';

class Body extends StatefulHookWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final state = useProvider(auth);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              Text("SIGNUP",
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig().textSize(context, 4))),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/images/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                validator: EmailValidator.validate,
                controller: emailController,
                inputType: TextInputType.emailAddress,
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedInputField(
                validator: UsernameValidator.validate,
                controller: usernameController,
                hintText: "Your Name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                validator: PhoneValidator.validate,
                controller: phoneController,
                inputType: TextInputType.phone,
                hintText: "Phone number",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                controller: passwordController,
                onChanged: (value) {},
              ),
              state.state == AuthState.Busy
                  ? SpinKitThreeBounce(
                      color: redColor,
                      size: 30,
                    )
                  : _button(state, emailController, passwordController,
                      usernameController, phoneController),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/images/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/images/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/images/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(
    AuthenticationState state,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController usernameController,
    TextEditingController phoneController,
  ) {
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
                    .signup(
                      emailController.text,
                      passwordController.text,
                      usernameController.text,
                      phoneController.text,
                    )
                    .then((signInUser) => gotoHomeScreen(context, state));
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
