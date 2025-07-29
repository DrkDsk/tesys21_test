import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;

  const ElevatedButtonWidget({
    super.key,
    this.onPressed,
    required this.iconData
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(color: theme.colorScheme.onPrimary, iconData),
    );
  }
}
