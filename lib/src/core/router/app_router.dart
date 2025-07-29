import 'package:flutter/material.dart';

class AppRouter {
  late NavigatorState navigator;

  AppRouter(BuildContext context) {
    navigator = Navigator.of(context);
  }

  static AppRouter of(BuildContext context) => AppRouter(context);

  Future<void> goToScreen(Widget screen) async {
    await navigator.push(_createRoute(screen));
  }

  void pop() => navigator.pop();

  PageRouteBuilder _createRoute(Widget screen) => PageRouteBuilder(
    pageBuilder: (_, __, ___) => screen,
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
