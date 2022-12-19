import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Colors.red.shade700;
  static Color secondary = Colors.red.shade300;

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,

    //AppBar
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    //Icons
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    //TextButton
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),

    //Floating Action Button
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primary),

    //Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      shape: const StadiumBorder(),
      elevation: 0,
    )),

    //Text Selection
    textSelectionTheme: TextSelectionThemeData(cursorColor: primary),

    //Navigation Bar
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: secondary),

    //Input Forms
    inputDecorationTheme: InputDecorationTheme(
      hoverColor: primary,
      iconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.focused)) {
          return primary;
        }
        if (states.contains(MaterialState.error)) {
          return Colors.deepOrange;
        }
        return Colors.grey;
      }),
      floatingLabelStyle: const TextStyle(
        color: Colors.black,
      ),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.black,
      )),
    ),
  );
}
