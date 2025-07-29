import 'package:flutter/material.dart';
import 'package:tesys21_test/src/core/extensions/int_extension.dart';
import 'package:tesys21_test/src/core/extensions/string_extension.dart';

class BaseStatsItemWidget extends StatelessWidget {
  const BaseStatsItemWidget({
    super.key,
    required this.statName,
    required this.baseStat,
    required this.baseStateValue,
  });

  final String statName;
  final int baseStat;
  final double baseStateValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              statName.capitalizeFirst(),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text("$baseStat"),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: baseStateValue,
            minHeight: 6,
            backgroundColor: Colors.grey[300],
            color: baseStateValue.statColor,
          ),
        ),
      ],
    );
  }
}