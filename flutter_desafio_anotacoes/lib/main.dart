import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'splash_screen.dart';

void main() {
  runApp(const BlocoAnotacoesApp());
}

class BlocoAnotacoesApp extends StatelessWidget {
  const BlocoAnotacoesApp({super.key});

  static const Color rosa = Color(0xFFB85C73);
  static const Color rosaEscuro = Color(0xFF7F354B);
  static const Color creme = Color(0xFFFFF9F6);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anotações',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: creme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: rosa,
          brightness: Brightness.light,
          surface: creme,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: creme,
          foregroundColor: rosaEscuro,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: rosa, width: 1.5),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
