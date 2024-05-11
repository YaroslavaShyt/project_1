import 'package:flutter/material.dart';

ThemeData light = ThemeData.light().copyWith(
    primaryColor: const Color(0xFF6FB08A),
    canvasColor: const Color(0xFF6FB08A),
    primaryColorLight: Colors.white);

ThemeData dark = ThemeData.dark().copyWith(
  primaryColor: Colors.black,
  canvasColor: const Color(0xFF6FB08A),
  primaryColorLight: Colors.white,
);
