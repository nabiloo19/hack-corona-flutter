import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hackcorona/providers/AppLangProvider.dart';
import 'package:hackcorona/screens/landing_screen.dart';
import 'package:hackcorona/utils/AppLocalization.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/logger.dart';
import 'package:provider/provider.dart';

class CoronaApp extends StatelessWidget {
  
  final AppLangProvider appLangProvider;
  
  const CoronaApp({this.appLangProvider});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLangProvider>(
          create: (_) => appLangProvider,
        )
      ],
      child: Consumer<AppLangProvider>(
        builder: (context, model, child) {
          ///Update Easy Localization's preference
          Log.log("APP", message: 'Current Locale = ${model.appLocale}');
          return MaterialApp(
            
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', 'US'),
              Locale('am', 'ET'),
            ],
            locale: model.appLocale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.background,
              bottomAppBarColor: AppColors.white,
              primaryColor: AppColors.primary,
              fontFamily: 'Poppins',
              primaryIconTheme:
              Theme
                  .of(context)
                  .iconTheme
                  .copyWith(color: AppColors.primary),
            ),
            title: 'Corona',
            home: SafeArea(
              child: LandingScreen(),
            ),
          );
        }
      ),
    );
  }
}
