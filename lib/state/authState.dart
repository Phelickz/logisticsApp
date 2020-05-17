



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:logistics/services/auth.dart';

const String kAuthError = 'error';
const String kAuthSuccess = 'success';
const String kAuthLoading = 'loading';
const String kAuthSignIn = 'signIn';
const String kUsername = 'Username';
const String kUID = 'uid';

class AuthenticationState with ChangeNotifier {

  String _authStatus;
  String _username;
  String _uid;
  String _email;
  String _password;
  String _error;
  QuerySnapshot _userData;

  String get authStatus => _authStatus;
  String get username => _username;
  String get uid => _uid;
  String get email => _email;
  String get password => _password;
  String get error => _error;

  AuthenticationState() {
    clearState();

    onAuthenticationChange((user) {
      if (user != null) {
        _authStatus = kAuthSuccess;
        _username = user[kUsername];
        _uid = user[kUID];
        _email = user[email];
      } else {
        clearState();
      }
      notifyListeners();
    });
  }

  void checkAuthentication() async {
    _authStatus = kAuthLoading;
    if (await isUserSignedIn()) {
      _authStatus = kAuthSuccess;
    } else {
      _authStatus = kAuthError;
    }
    notifyListeners();
  }

  void clearState() {
    _authStatus = null;
    _username = null;
    _uid = null;
    _email = null;
  }
  
  Future signup(email, password, username, phone) async {
    return await signUp(email, password, username, phone);
  }

  Future signupRider(email, password, username, phone, String riderID) async {
    return await signUpRider(email, password, username, phone, riderID);
  }

 Future login(
    email,
    password,
  ) async {
    try {
     await signIn(
        email,
        password,
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // void loginTest(email, password){
  //   signInWithEmail(email, password);
  // }

  logout() async {
    clearState();
    await signOut();
    notifyListeners();
  }

  currentUser() {
    notifyListeners();
    return getUser();
  }

  currentUserId() {
    // notifyListeners();
    return getUserId();
  }

  Map<String, String> exposeCurrentUser() {
    notifyListeners();
    return exposeUser(kUsername: username, kUID: uid);
    // notifyListeners();
  }

  checkUser() {
    isUserSignedIn();
  }

  void forgotPassword(email) {
    sendPasswordResetEmail(email);
    notifyListeners();
  }

}