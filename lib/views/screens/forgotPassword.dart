import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logistics/services/colors.dart';
import 'package:logistics/services/responsiveness/altres.dart';
import 'package:logistics/services/responsiveness/responsiveness.dart';
import 'package:logistics/services/snackbarService.dart';
import 'package:logistics/state/authState.dart';
import 'package:logistics/state/providers.dart';
import 'package:logistics/views/authScreen/login/background.dart';
import 'package:logistics/views/authScreen/widgets/input_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'login.dart';

class ForgotPassword extends StatefulHookWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _error;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(auth);
    SnackBarService.instance.buildContext = context;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Background(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: McGyver.rsDoubleH(context, 2)),
            Text("Forgot Password ?",
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig().textSize(context, 4))),
            SizedBox(height: McGyver.rsDoubleH(context, 4)),
            Container(
              child: SvgPicture.asset(
                "assets/images/login.svg",
                // height: size.height * 0.35,
              ),
              height: McGyver.rsDoubleH(context, 35),
              width: double.infinity,
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 6),
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      'Enter the email address associated with your account',
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(height: McGyver.rsDoubleH(context, 8)),
                  Align(
                    alignment: Alignment.center,
                    child: RoundedInputField(
                      validator: EmailValidator.validate,
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      hintText: "Your Email",
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: McGyver.rsDoubleH(context, 2)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: McGyver.rsDoubleW(context, 2)),
                      child: Container(
                        height: McGyver.rsDoubleH(context, 8),
                        width: McGyver.rsDoubleW(context, 40),
                        color: Colors.transparent,
                        child: RaisedButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig().textSize(context, 3.4),
                                  color: Colors.black),
                            ),
                            color: redColor,
                            onPressed: () {
                              final form = formKey.currentState;
                              form.save();
                              if (form.validate()) {
                                try {
                                  state.forgotPassword(emailController.text);
                                } catch (e) {
                                  print(e);
                                }
                              }
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 3),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        'Go Back',
                        style: GoogleFonts.aBeeZee(
                            fontSize: SizeConfig().textSize(context, 3),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.green,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
                child: Text(
              _error,
              maxLines: 3,
            )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  }),
            )
          ],
        ),
      );
    }
    return Container(
        height: 0,
        width: double.infinity,
        color: Colors.red,
        child: SizedBox(height: 20));
  }
}
