import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livvy_app/pages/auth/log_in.dart';
import 'package:livvy_app/pages/auth/sign_in/sign_in_first.dart';
import 'package:livvy_app/pages/auth/sign_in/sign_in_second.dart';
import 'package:livvy_app/pages/down_payment/down_payment_top_up.dart';
import 'package:livvy_app/pages/home/main.dart';
import 'package:livvy_app/pages/liv_path/liv_path_breakdown.dart';
import 'package:livvy_app/pages/liv_path/liv_path_home_result.dart';
import 'package:livvy_app/pages/liv_path/liv_path_home_search.dart';
import 'package:livvy_app/pages/liv_path/liv_path_profile.dart';
import 'package:livvy_app/pages/misc/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
            background: Colors.white,
            brightness: Brightness.light,
            primary: const Color(0xFF005792),
            secondary: const Color(0xFF00395f),
            tertiary: const Color(0xFF0094f8),
            error: Colors.white,
            onBackground: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.copyWith(
                displayLarge: const TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
                displaySmall:
                    const TextStyle(color: Colors.white, fontSize: 16),
                displayMedium: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                bodyMedium: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                titleMedium:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                bodySmall: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                )),
          ),
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)))),
      home: const OnboardingScreen(),
      builder: EasyLoading.init(),
    );
  }
}
