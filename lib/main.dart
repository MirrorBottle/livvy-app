import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livvy_app/pages/auth/log_in.dart';
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
                displaySmall: const TextStyle(
                    color: Colors.white,
                    fontSize: 16),
                bodyMedium: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                bodySmall: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                )),
          ),
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)))),
      home: const LogInScreen(),
    );
  }
}
