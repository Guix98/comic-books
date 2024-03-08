import 'package:flutter/material.dart';

ThemeData webTheme() {
  return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey,
    primary: Colors.grey[350],
    onPrimary: Colors.grey[350],
  )).copyWith(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[350], foregroundColor: Colors.black));
}
