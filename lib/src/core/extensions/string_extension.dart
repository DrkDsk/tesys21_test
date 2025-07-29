
import 'package:flutter/material.dart';

extension StringCasingExtension on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension CleanDescriptionExtension on String {
  String cleanNewlines() {
    return replaceAll(RegExp(r'[\n\f\r]+'), ' ').trim();
  }
}

extension StringToColorExtension on String {
  Color get toColor {
    switch (toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'brown':
        return Colors.brown;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'gray':
      case 'grey':
        return Colors.grey;
      case 'orange':
        return Colors.orange;
      default:
        return Colors.grey.shade400;
    }
  }
}

