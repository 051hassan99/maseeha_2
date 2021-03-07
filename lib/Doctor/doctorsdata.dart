import 'package:flutter/foundation.dart';

class Doctor {
  @required
  final int id;
  @required
  final String fullName;
  @required
  final String pmdc;
  @required
  final String degree;
  @required
  final String specialization;

  Doctor({this.id, this.fullName, this.pmdc, this.degree, this.specialization});

  
}
