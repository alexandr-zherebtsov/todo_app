import 'package:flutter/material.dart';

class AppColors {
  static const Color transparent = Colors.transparent;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color lightGrey = Color(0xFFDADADA);
  static const Color green = Color(0xFF51BF7D);
  static const Color red = Color(0xFFF64A32);
  static const Color whiteWithBlue1 = Color(0xFFF6F7FF);
  static const Color whiteWithBlue2 = Color(0xFFFBFCFF);

  static const Color labYellow = Color(0xFFFFFA86);
  static const Color labOrange = Color(0xFFFFD686);
  static const Color labTurquoise = Color(0xFF86FFF8);
  static const Color labPurple = Color(0xFF8886FF);
  static const Color labPink = Color(0xFFFF86E4);
  static const Color labGreen = Color(0xFF97FF86);
  static const Color labAquamarine = Color(0xFF86FFB6);
  static const Color labHeliotrope = Color(0xFFD886FF);
  static const Color labBlue = Color(0xFF86B6FF);
  static const Color labRed = Color(0xFFFF8686);

  static const MaterialColor primary = MaterialColor(0xFF979FFB, primaryMaterial);

  static const Map<int, Color> primaryMaterial = <int, Color>{
    50: Color.fromRGBO(151, 159, 251, .1),
    100: Color.fromRGBO(151, 159, 251, .2),
    200: Color.fromRGBO(151, 159, 251, .3),
    300: Color.fromRGBO(151, 159, 251, .4),
    400: Color.fromRGBO(151, 159, 251, .5),
    500: Color.fromRGBO(151, 159, 251, .6),
    600: Color.fromRGBO(151, 159, 251, .7),
    700: Color.fromRGBO(151, 159, 251, .8),
    800: Color.fromRGBO(151, 159, 251, .9),
    900: Color.fromRGBO(151, 159, 251, 1),
  };
}
