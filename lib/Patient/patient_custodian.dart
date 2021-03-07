import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maseeha_2/localization/demo_localization.dart';
import '../lang_selector.dart';
import 'main_drawer.dart';

class PatientCustodian extends StatelessWidget {
  final Widget svg = SvgPicture.asset('assets/images/svg,svg',
      color: Colors.red, semanticsLabel: 'Acme Logo');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //  var _mainColor = Theme.of(context).primaryColor;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(
              right: size.width / 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: size.width * 0.28,
                  child: Center(
                    child: Text(
                      DemoLocalization.of(context).getTranslatedValue('title'),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                  left: size.width / 30,
                  right: size.width / 30,
                ),
                child: LangSelector()),
          ],
        ),
        drawer: MainDrawer(),
        body: ListView(children: [
          Container(
              margin: EdgeInsets.only(
                top: size.height / 35,
                bottom: size.width / 30,
              ),
              child: Row(
                children: [
                  Text(
                    DemoLocalization.of(context)
                        .getTranslatedValue('patientcustodian'),
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                    ),
                  ),
                  FlatButton(onPressed: null, child: Text('data')),
                ],
              )),

//--------------------------------------SYRUP-------------------------------------------------
          FittedBox(
              fit: BoxFit.contain,
              child: _buildCard(
                svgPicture: SvgPicture.asset('assets/images/syrup.svg',
                    color: Colors.red, semanticsLabel: 'syrup'),
                column: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ('CALPOL'),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ('Syrup'),
                    ),
                    Text(
                      ('Moring: 10:00 am'),
                    ),
                    Text(
                      ('Evening: 05:00 pm'),
                    ),
                  ],
                ),
                context: context,
              )),
          //--------------------------------------TABLET-------------------------------------------------
          FittedBox(
              fit: BoxFit.contain,
              child: _buildCard(
                svgPicture: SvgPicture.asset('assets/images/capsule.svg',
                    color: Colors.red, semanticsLabel: 'Tablet'),
                column: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ('Augmentin'),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ('Tablet'),
                    ),
                    Text(
                      ('Moring: 10:00 am'),
                    ),
                    Text(
                      ('Evening: 05:00 pm'),
                    ),
                  ],
                ),
                context: context,
              )),
        ]));
  }
}

Container _buildCard(
    {final SvgPicture svgPicture, final Column column, BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: size.height / 3.7,
    width: size.width / 1.6,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height / 11,
          width: size.width / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 4,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: svgPicture,
        ),
        Padding(
          padding: EdgeInsets.all(size.width / 30),
          child: column,
        ),
      ],
    ),
  );
}
