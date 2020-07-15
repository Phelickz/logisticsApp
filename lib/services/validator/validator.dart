
import 'package:get/utils.dart';

class EmailValidator {
  static String validate(String value) {
    bool isEmail = GetUtils.isEmail(value);
    if(!isEmail){
      return 'Please enter a valid email';
    }
    return null;
  }
}

class UsernameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Username cannot be empty";
    }
    if (value.length < 2) {
      return "Username is too short";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    }
    return null;
  }
}

class PhoneValidator {
  static String validate(String value) {
    if (value.length < 10) {
      return "Please enter a valid number";
    }
    return null;
  }
}
