import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: isDarkTheme
          ? const MaterialColor(
              0xFFFFFFFF,
              <int, Color>{
                50: Color(0xFFFFFFFF),
                100: Color(0xFFFFFFFF),
                200: Color(0xFFFFFFFF),
                300: Color(0xFFFFFFFF),
                400: Color(0xFFFFFFFF),
                500: Color(0xFFFFFFFF),
                600: Color(0x99FFFFFF),
                700: Color(0x8AFFFFFF),
                800: Color(0x62FFFFFF),
                900: Color(0xB3FFFFFF),
              },
            )
          : Colors.blue,
      primaryColor: isDarkTheme ? Colors.white : Colors.blue,
      backgroundColor: isDarkTheme ? Colors.black12 : Colors.white,
      primaryColorLight: isDarkTheme ? Colors.white60 : Colors.blue,
      primaryColorDark: isDarkTheme ? Colors.white70 : Colors.blue.shade700,
      fontFamily: 'EBGaramond',
      textTheme: TextTheme(
        headline3: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 40,
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        headline4: TextStyle(
          fontFamily: 'Proxima-Nova',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? Colors.black : Colors.white,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Proxima-Nova',
          fontSize: 22,
          letterSpacing: 1,
          fontWeight: FontWeight.w500,
          color: isDarkTheme ? Colors.black : Colors.white,
        ),
      ),

      // INPUT DECORATION THEME
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(7),
        errorStyle: TextStyle(
          color: Colors.white,
        ),
        labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(225, 177, 44, 1.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(39, 60, 117, 1.0)),
        ),
      ),
    );
  }
}
