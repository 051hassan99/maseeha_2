import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AppUserData extends ChangeNotifier {
  String name;
  String email;
  String address;
  String password;
  String confirmPass;
  bool loading;
  bool securetext = true;

  AppUserData() {
    loading = false;
  }

  void secureText() {
    securetext = !securetext;
    notifyListeners();
  }

  void toggleLoading() {
    loading = !loading;
    notifyListeners();
  }

  void sendVerificationEmail() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    await user.sendEmailVerification();
  }

  Future<bool> registerUser() async {
    final auth = FirebaseAuth.instance;
    try {
      toggleLoading();
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((_) {
        sendVerificationEmail();
      });
      toggleLoading();
      return true;
    } catch (err) {
      print(err.toString());
    }
    toggleLoading();
    return false;
  }
}
