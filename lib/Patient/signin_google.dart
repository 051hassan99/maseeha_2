library maseeha.googleauth;

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maseeha_2/Patient/patient_dashboard.dart';
import 'package:maseeha_2/Patient/patient_login.dart';

_GoogleAuth abc = _GoogleAuth.getInstance();
enum E { username, email, photoURL }

class _GoogleAuth {
  static _GoogleAuth _instance = new _GoogleAuth();
  bool isGoogleLoggedIn = false;

  List<String> userProfileList = [];
  static _GoogleAuth getInstance() {
    if (_instance == null) {
      _instance = new _GoogleAuth();
    }
    return _instance;
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  login(BuildContext context) async {
    try {
      await _googleSignIn.signIn();

      userProfileList[E.username.index] = _googleSignIn.currentUser.displayName;
      userProfileList[E.email.index] = _googleSignIn.currentUser.email;
      userProfileList[E.photoURL.index] = _googleSignIn.currentUser.photoUrl;
      isGoogleLoggedIn = true;
      takeToPatientDashboard(context);
    } catch (err) {
      print(err);
    }
  }

  logout(BuildContext context) async {
    _googleSignIn.signOut();
    isGoogleLoggedIn = false;
    takeToPatientLogIn(context);
  }

  takeToPatientDashboard(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                (userProfileList != null ? PatientDashboard() : () => {})));
  }

  takeToPatientLogIn(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                (userProfileList != null ? PatientLogin() : () => {})));
  }
}
