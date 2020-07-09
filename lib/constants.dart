import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(color: kAppbarColor, elevation: 2.0),
  scaffoldBackgroundColor: kScaffoldColor,
  bottomAppBarColor: kAppbarColor,
);

const kAppbarColor = Color(0xFFEC407A);
const kScaffoldColor = Color(0xff090B22);
const kInactiveColor = Color(0xFF555668);
const kHeight = Color(0xFF686C7E);
const kActiveColor = Color(0xFF1C1E33);
const kSelectedIconColor = Colors.white;
const kIconColor = Colors.amber;

const kFixedTextStyle = TextStyle(
  color: kHeight,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
  fontSize: 15.0,
);

const kNumbericTextStyle = TextStyle(
  color: kSelectedIconColor,
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);

const kBottomButton = TextStyle(
  color: kSelectedIconColor,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

const kResultTitle = TextStyle(
  color: kSelectedIconColor,
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

final snackBar = SnackBar(
    backgroundColor: Colors.black,
    duration: Duration(seconds: 1),
    content: Text(
      'Please Select the Gender...!',
      style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 20.0),
    ));
