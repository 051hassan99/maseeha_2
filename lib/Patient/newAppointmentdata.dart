import 'package:flutter/cupertino.dart';

class NewAppointmentData extends ChangeNotifier {
  String name;
  int age;
  String appointmenttype;
  String gender;
  String diseaseDescription;
  String phonenumber;

  void genderChanged(String value) {
    gender = value;
    notifyListeners();
  }

  void apponitmentChanged(String value) {
    appointmenttype = value;
    notifyListeners();
  }
}
