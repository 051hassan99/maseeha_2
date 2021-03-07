library maseeha.auth;

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:maseeha_2/Patient/patient_dashboard.dart';
import 'package:maseeha_2/Patient/patient_login.dart';

_Auth a = _Auth.getInstance();

enum E { username, email, photoURL }

class _Auth {
  static _Auth _instance = new _Auth();
  bool isLoggedIn = false;
  List<String> userProfileList = [];
  Map userProfile;
  static final facebookLogin = FacebookLogin();

  _Auth();

  static _Auth getInstance() {
    if (_instance == null) {
      _instance = new _Auth();
    }
    return _instance;
  }

  logInWithFb(BuildContext context) async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final uri = Uri(
            host:
                'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final graphResponse = await http.get(uri);
        final profile = JSON.jsonDecode(graphResponse.body);
        takeToPatientDashboard(context);
        print(profile);
        userProfile = profile;

        userProfileList[E.username.index] = userProfile['name'];
        userProfileList[E.email.index] = userProfile['email'];
        userProfileList[E.photoURL.index] =
            userProfile['picture']['data']['url'];

        isLoggedIn = true;
        print('something');
        break;

      case FacebookLoginStatus.cancelledByUser:
        isLoggedIn = false;
        print('something cancelled');
        break;
      case FacebookLoginStatus.error:
        isLoggedIn = false;
        print('something error');
        break;
    }
  }

  logout(BuildContext context) async {
    facebookLogin.logOut();
    isLoggedIn = false;
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
