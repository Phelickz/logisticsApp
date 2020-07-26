import 'package:flutter/material.dart';
import 'package:logistics/services/validator/validator.dart';



import '../constants.dart';
import 'text_field.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Widget suffixIcon;
  final bool obscure;
  RoundedPasswordField({
    Key key,
    this.onChanged, this.controller, this.suffixIcon, this.obscure,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: PasswordValidator.validate,
        obscureText: obscure,
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
