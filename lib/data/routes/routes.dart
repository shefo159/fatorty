import 'package:flutter/material.dart';

import '../../presentation/page/expenses.dart';
import '../../presentation/page/splash.dart';

class Routes {
  static const String home = _AppRoutes.home;
  static const String splash = _AppRoutes.splash;

  static const String initialRoute = _AppRoutes.splash;
  static final Map<String, Widget Function(BuildContext)> routes = {
    _AppRoutes.home: (context) => const ExpensesPage(),
    _AppRoutes.splash: (context) => const Splash(),
  };
}

class _AppRoutes {
  static const String home = '/';
  static const String splash = '/splash';
}