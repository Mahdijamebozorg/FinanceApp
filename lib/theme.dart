import 'package:Moneyapp/Vars&voids.dart';
import 'package:flutter/material.dart';
import 'main.dart';

var apearance = MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.blue,
    textTheme: ThemeData.light().textTheme.copyWith(
          //titles
          headline1: TextStyle(
              color: darktheme ? Colors.white : Colors.black,
              fontSize: 20,
              fontFamily: '(51)'),
          //drawerlist
          bodyText1: TextStyle(
              color: darktheme ? Colors.white : Colors.black,
              fontSize: 25,
              fontFamily: '(50)'),
        ),

    //appbar
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: '(51)',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
    ),
    //buttons
    buttonTheme: ButtonThemeData(
      highlightColor: darktheme ? Colors.lightBlue : Colors.blue[900],
    ),
    //highlightColor
    highlightColor: darktheme ? Colors.white : Colors.black,
    //popupmenu
    popupMenuTheme: PopupMenuThemeData(
      color: darktheme ? Colors.black : Colors.white,
      textStyle: TextStyle(
        color: darktheme ? Colors.white : Colors.black,
      ),
    ),
    //bottomappbar
    bottomAppBarTheme: BottomAppBarTheme(
      color: darktheme ? Colors.blue[900] : Colors.lightBlue,
    ),
    //float action button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darktheme ? Colors.blue[800] : Colors.blue[600],
      foregroundColor: darktheme ? Colors.black : Colors.white,
    ),
    //timepicker
    timePickerTheme: TimePickerThemeData(
      backgroundColor: darktheme ? Colors.black : Colors.white,
      dialBackgroundColor: darktheme ? Colors.black : Colors.white,
      dayPeriodTextColor: darktheme ? Colors.white : Colors.black,
      dialTextColor: darktheme ? Colors.white : Colors.black,
    ),
  ),
  ////////////////////////////////////
  title: 'My expenses',
  debugShowCheckedModeBanner: false,
  home: Mainpage(),
);
