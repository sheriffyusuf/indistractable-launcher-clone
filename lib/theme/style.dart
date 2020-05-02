import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

//static const Color _darkPrimaryColor = Colors.white24;
//static const Color _darkPrimaryVariantColor = Colors.black;
//static const Color _darkSecondaryColor = Colors.white;
//static const Color _darkOnPrimaryColor = Colors.white;

ThemeData appThemeWhite = ThemeData(
  primarySwatch: Colors.green,
  hintColor: Colors.green,
  textTheme: TextTheme(
    title: TextStyle(fontFamily: "Poppins", fontSize: 16, color: Colors.white),
    display1: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
    display4: TextStyle(
      //   fontFamily: 'Corben',

      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    ),
  ),
);

AppTheme blackAppTheme() {
  return AppTheme(
    id: "black_theme",
    description: "White on Black Color Scheme",
    data: ThemeData(
        accentColor: Colors.grey,
        primaryColor: Colors.black,
        //   canvasColor: Colors.black,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.light(
          primary: Colors.white24,
          primaryVariant: Colors.black,
          secondary: Colors.white,
          onPrimary: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)))

        //   textTheme: TextTheme(body1: TextStyle(color: Colors.white))
        //buttonColor: Colors.amber,
        // dialogBackgroundColor: Colors.yellow,
        ),
  );
}
