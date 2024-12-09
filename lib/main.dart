import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/splash_screen.dart';

Future<void> main() async {
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: const SplashScreen(),
    );
  }
}
