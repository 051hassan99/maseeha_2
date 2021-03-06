import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maseeha_2/Doctor/doctorRegisterData.dart';
import 'package:maseeha_2/Doctor/doctor_dashboard.dart';
import 'package:maseeha_2/Doctor/doctor_signup.dart';
import 'package:maseeha_2/Doctor/loginDoctorData.dart';
import 'package:maseeha_2/lang_selector.dart';
import 'package:maseeha_2/localization/demo_localization.dart';
import 'package:provider/provider.dart';

class DoctorLogin extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    createAlertDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                DemoLocalization.of(context)
                    .getTranslatedValue('messagefrommaseeha'),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              content: Text(
                DemoLocalization.of(context)
                    .getTranslatedValue('messagemaseeha'),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          });
    }

    final loginDoctorData =
        Provider.of<LoginDoctorData>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: [
              Container(
                height: (size.height * 2.5) / 10,
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        DemoLocalization.of(context).getTranslatedValue('d'),
                        style: GoogleFonts.rajdhani(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          right: 10,
                          bottom: 80,
                        ),
                        child: LangSelector()),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: (size.height * 7) / 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                        topRight: Radius.circular(80.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                    child: Form(
                      key: _formkey,
                      child: Consumer<LoginDoctorData>(
                        builder: (_, logindoctordata, child) {
                          if (logindoctordata.loading) {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                            );
                          } else {
                            return child;
                          }
                        },
                        child: ListView(
                          children: [
                            Container(
                              height: size.height / 15,
                              margin: EdgeInsets.symmetric(
                                vertical: size.height / 35,
                              ),
                              child: Center(
                                child: Text(
                                  DemoLocalization.of(context)
                                      .getTranslatedValue('ltc'),
                                  style: GoogleFonts.rajdhani(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 9),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                padding: EdgeInsets.all(4),
                                width: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFBC7C7C7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      child: Icon(
                                        Icons.email,
                                        size: 25,
                                        color: Color(0xFFBB9B9B9),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: DemoLocalization.of(context)
                                              .getTranslatedValue('eemail'),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(10),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return DemoLocalization.of(context)
                                                .getTranslatedValue(
                                                    'emailrequired');
                                          }
                                          if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return DemoLocalization.of(context)
                                                .getTranslatedValue(
                                                    'entervalidemail');
                                          }
                                          return null;
                                        },
                                        onChanged: (String value) {
                                          loginDoctorData.docEmail = value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 9),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                padding: EdgeInsets.all(4),
                                width: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFBC7C7C7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      child: Icon(
                                        Icons.vpn_key,
                                        size: 25,
                                        color: Color(0xFFBB9B9B9),
                                      ),
                                    ),
                                    Expanded(
                                      child: Consumer<DoctorRegisterData>(
                                        builder: (context, docdata, _) {
                                          return TextFormField(
                                            decoration: InputDecoration(
                                              hintText: DemoLocalization.of(
                                                      context)
                                                  .getTranslatedValue('epass'),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  top: 14, left: 10),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.remove_red_eye,
                                                  color: Color(0xFFBB9B9B9),
                                                ),
                                                onPressed: () {
                                                  docdata.secureText();
                                                },
                                              ),
                                            ),
                                            obscureText: docdata.securetext,
                                            validator: (String value) {
                                              if (value.isEmpty) {
                                                return DemoLocalization.of(
                                                        context)
                                                    .getTranslatedValue(
                                                        'passwordrequired');
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              loginDoctorData.docPassword =
                                                  value;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height / 18,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      width: (size.width) / 3,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(80),
                                      ),
                                      child: FlatButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Text(
                                            DemoLocalization.of(context)
                                                .getTranslatedValue('signin'),
                                            style: GoogleFonts.rajdhani(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          onPressed: () async {
                                            if (!_formkey.currentState
                                                .validate()) {
                                              return;
                                            } else {
                                              _formkey.currentState.save();

                                              final check =
                                                  await loginDoctorData
                                                      .signUser();

                                              if (check) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DoctorDashboard()),
                                                );
                                              } else {
                                                createAlertDialog(context);
                                              }
                                            }
                                          }),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                        right: 20,
                                      ),
                                      width: ((size.width) * 1.5) / 3,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(80),
                                      ),
                                      child: FlatButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Text(
                                            DemoLocalization.of(context)
                                                .getTranslatedValue(
                                                    'newmember'),
                                            style: GoogleFonts.rajdhani(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DoctorSignup()),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
