import 'package:flutter/material.dart';
import 'package:hackcorona/screens/home_screen.dart';
import 'package:hackcorona/utils/colors.dart';

class CoronaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      bottomAppBarColor: AppColors.white,
      primaryColor: AppColors.primary,
      fontFamily: 'Poppins',
      primaryIconTheme:Theme.of(context).iconTheme.copyWith(color: AppColors.primary),
      
      ),
      title: 'Corona',
      home: SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
