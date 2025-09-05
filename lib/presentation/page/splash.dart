import 'dart:async';

import 'package:flutter/material.dart';

import '../../business/expense_controller.dart';
import '../../data/const/locals.dart';
import '../../data/localization/local.dart';
import '../../data/repo_imp/db.dart';
import '../../data/routes/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});


  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  ExpenseController controller = ExpenseController();

  Future<void> initApp() async {
    await DB().init();
    debugPrint('db initialized');

    controller.getAllExpenses();
    debugPrint('controller initialized');
  }

  @override
  void initState() {
    super.initState();
    initApp();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, Routes.home);
    });
    Locale currentLocale = Localizations.localeOf(context);
    var loc = AppLocalizations(currentLocale);
    return Scaffold(
      body: Center(
        child: Text(loc.translate(appLogo),style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
