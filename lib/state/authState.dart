



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:logistics/services/auth.dart';
import 'package:logistics/services/firestore.dart';
import 'package:logistics/services/models.dart';
import 'package:logistics/services/snackbarService.dart';

const String kAuthError = 'error';
const String kAuthSuccess = 'success';
const String kAuthLoading = 'loading';
const String kAuthSignIn = 'signIn';
const String kUsername = 'Username';
const String kUID = 'uid';

final FirebaseAuth _auth = FirebaseAuth.instance;
final Firestore _firestore = Firestore.instance;
String error;
String bio = "Hi, I'm new here";
AuthStatus status;


enum AuthState {
  Busy,
  Idle
}

class AuthenticationState with ChangeNotifier {

  AuthState _state = AuthState.Idle;

  AuthState get state => _state;


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

  void setState(AuthState state){
    _state = state;
    notifyListeners();
  }

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
  
  
Future<Map<String, String>> signup(
  String email,
  String password,
  String name,
  String phone,
) async {
  setState(AuthState.Busy);
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
    final FirebaseUser user = result.user;
    // user1 = result.user;
    SnackBarService.instance.showSnackBarSuccess('Account Created for ${user.email}');
    assert(user != null);
    assert(await user.getIdToken() != null);

    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    
    userUpdateInfo.photoUrl =
        'https://www.kindpng.com/picc/b/78-785827_avatar-png-icon.png';
    await user.updateProfile(userUpdateInfo).then((user) {
      _auth.currentUser().then((user) {
        final DocumentReference _documentReference = _firestore
            .collection('userData')
            .document(user.uid);
        _documentReference.setData({
          'email': user.email,
          'username': user.displayName,
          'photoUrl': user.photoUrl,
          'phone': phone,
          'uid': user.uid,
          'status': 'user',
          'completedOrders': 0,
          'createdAt': Timestamp.now(),
          'documentId': _documentReference.documentID,
        }).catchError((e) {
          print(e);
        });
      }).catchError((e) {
        print(e);
      });
    }).catchError((e) {
      print(e);
    });
    await user.reload();
    // await _fireStoreService.createUser(user);
    setState(AuthState.Idle);
    print('Account created');
    print('$user.uid');
    return exposeUser(kUsername: user.displayName, kUID: user.uid);
  } catch (e) {
    setState(AuthState.Idle);
    String error = e.message;
    SnackBarService.instance.showSnackBarError(error);
  }
}

  Future signupRider(email, password, username, phone, String riderID) async {
    return await signUpRider(email, password, username, phone, riderID);
  }

 Future<Map<String, String>> login(
  String email,
  String password,
) async {
  setState(AuthState.Busy);
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email.trim(), password: password);
    final FirebaseUser user = result.user;
    // user1 = result.user;
    setState(AuthState.Idle);
    SnackBarService.instance.showSnackBarSuccess('Welcome, ${user.email}');
    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    print('signIn succeeded : $user');
    print('User signed in');
    return exposeUser(kUsername: user.displayName, kUID: user.uid);
  } catch (e) {
    setState(AuthState.Idle);
    String error = e.message;
    SnackBarService.instance.showSnackBarError(error);
    
    print(error);
  }
  notifyListeners();
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
  }

  loadRequestedOrders(String uid){
    return getOrdersListWithId(uid);
  }

  Stream<List<RequestedOrders>> getOrders(){
    return getAllOrders();
  }

}