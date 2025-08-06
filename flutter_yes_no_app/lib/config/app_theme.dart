import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 2, 45, 133);

const List<Color> _colorsTheme = [
  _customColor,
  Colors.purple,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor < _colorsTheme.length,
        'selectedColor must be between 0 and ${_colorsTheme.length - 1}',
      );

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsTheme[selectedColor],
      // brightness: Brightness.dark
    );
  }
}
