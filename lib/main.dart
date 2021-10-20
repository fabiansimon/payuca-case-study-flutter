import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:payuca_case_study/screens/DetailScreen.dart';
import 'package:payuca_case_study/screens/EmailScreen.dart';
import 'package:payuca_case_study/screens/FAQScreen.dart';
import 'package:payuca_case_study/screens/GarageScreen.dart';
import 'package:payuca_case_study/screens/HelpCenterScreen.dart';
import 'package:payuca_case_study/screens/LegalScreen.dart';
import 'package:payuca_case_study/screens/ReaderDetail.dart';
import 'package:payuca_case_study/screens/TabNavigator.dart';
import 'package:payuca_case_study/screens/WelcomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payuca Case Study',
      debugShowCheckedModeBanner: false,
      initialRoute: 'WelcomeScreen',
      // ignore: always_specify_types
      routes: {
        'TabNavigator': (BuildContext context) => TabNavigator(),
        'WelcomeScreen': (BuildContext context) => WelcomeScreen(),
        'GarageScreen': (BuildContext context) => GarageScreen(),
        'EmailScreen': (BuildContext context) => EmailScreen(),
        'DetailScreen': (BuildContext context) => DetailScreen(),
        'HelpCenterScreen': (BuildContext context) => HelpCenterScreen(),
        'LegalScreen': (BuildContext context) => LegalScreen(),
      },

      theme: ThemeData(
        fontFamily: 'OpenSans',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            height: 1.41,
          ),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            height: 1.33,
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            height: 1.27,
          ),
          headline4: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            height: 1.22,
          ),
          subtitle1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            height: 1.19,
          ),
          subtitle2: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            height: 1.16,
          ),
          bodyText1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: 1.22,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            height: 1.19,
          ),
          // caption == label
          caption: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            height: 1.16,
          ),
          // overline == code
          overline: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.w400,
            height: 1.82,
          ),
        ),
      ),
      // home: WelcomeScreen(),
      // home: EmailScreen(),
    );
  }
}
