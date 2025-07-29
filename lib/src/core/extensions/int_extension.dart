import 'dart:ui';

import 'package:flutter/material.dart';

extension IntWeightExtension on int? {
  double toKilograms() {
    if (this == null) return 0.0;
    return this! / 10;
  }

  double toMeters() {
    if (this == null) return 0.0;
    return this! / 10;
  }
}

extension StatColorExtension on double {
  Color get statColor {
    if (this >= 0.5) return Colors.green;
    if (this >= 0.2) return Colors.yellow;
    return Colors.red;
  }
}