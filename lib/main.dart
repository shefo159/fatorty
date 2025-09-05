import 'package:fatorty/data/routes/routes.dart';
import 'package:fatorty/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import 'data/localization/local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      locale: Locale('ar'),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routes: Routes.routes,
      initialRoute: Routes.initialRoute,
    );
  }
}
