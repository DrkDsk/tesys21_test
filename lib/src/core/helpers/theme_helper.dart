import 'package:flutter/material.dart';
import 'package:tesys21_test/src/core/theme/light_theme.dart';

class ThemeHelper {

  static ThemeData getThemeData({required BuildContext context}) {
    //Lo ideal es que en esta implementacion puedas crear la configuracion
    //del tema, dependiendo del
    return lightTheme;
  }
}