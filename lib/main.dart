import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maseeha_2/Caretaker/caretakerRegister.dart';
import 'package:maseeha_2/Caretaker/loginCaretakerData.dart';
import 'package:maseeha_2/DataHandler/AppData.dart';
import 'package:maseeha_2/Doctor/bmiContainer_Data.dart';
import 'package:maseeha_2/Doctor/bmrContainerData.dart';
import 'package:maseeha_2/Doctor/doctorRegisterData.dart';
import 'package:maseeha_2/Doctor/loginDoctorData.dart';
import 'package:maseeha_2/Doctor/upeeContainerData.dart';
import 'package:maseeha_2/Patient/AppUserData.dart';
import 'package:maseeha_2/Patient/loginPatientData.dart';
import 'package:maseeha_2/Patient/newAppointmentdata.dart';
import 'package:maseeha_2/localization/demo_localization.dart';
import 'package:maseeha_2/splashScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var bgcolor = Colors.blue;
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppUserData(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginPatientData(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorRegisterData(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginDoctorData(),
        ),
        ChangeNotifierProvider(
          create: (context) => CaretakerRegisterData(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginCaretakerData(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewAppointmentData(),
        ),
        ChangeNotifierProvider(
          create: (context) => BMIContainerData(),
        ),
        ChangeNotifierProvider(
          create: (context) => UPEEContainerData(),
        ),
        ChangeNotifierProvider(
          create: (context) => BMRContainerData(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppData(),
        ),
      ],
      child: MaterialApp(
        locale: _locale,
        supportedLocales: [Locale('en', 'US'), Locale('ur', 'PK')],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // hassabahmed
          primaryColor: bgcolor,
        ),
        home: Scaffold(
            body: Container(
          child: SplashScreen(),
        )),
      ),
    );
  }
}
