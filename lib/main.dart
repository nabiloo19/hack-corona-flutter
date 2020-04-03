import 'package:flutter/material.dart';
import 'package:hackcorona/app.dart';
import 'package:hackcorona/providers/AppLangProvider.dart';

void main() async {
  ///Since we have a binding before calling runApp() method.
  WidgetsFlutterBinding.ensureInitialized();
  
  ///Get the default or saved locale
  AppLangProvider langProvider = AppLangProvider();
  await langProvider.fetchLocale();

  runApp(
    CoronaApp(
      appLangProvider: langProvider,
    ),
  );
}
