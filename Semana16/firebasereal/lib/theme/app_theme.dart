import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
 static const Color cardColor = Color(0xFFFFFFFF);
 static const Color textPrimaryColor = Color.fromARGB(255, 17, 1, 40);
 static const Color textSecondaryColor = Color.fromARGB(255, 82, 80, 85); 
 static const Color borderColor = Color.fromARGB(255, 240, 240, 240);
 static const Color errorColor = Color.fromARGB(255, 226, 12, 12);
 static const Color successColor = Color.fromARGB(255, 24, 237, 31);

 static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 63, 81, 181),
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 3, 201, 169),
      onSecondary: Colors.white,
      error: errorColor,
      onError: Colors.white,
      background: Color.fromARGB(255, 242, 242, 242),
      onBackground: textPrimaryColor,
      surface: cardColor,
      onSurface: textPrimaryColor,
    ),

    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),    
    )
 );
}
