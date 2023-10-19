import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final ButtonStyle? styleButton;
  final TextStyle? mainTextWhite;
  final TextStyle? mainTextBlack;
  

  CustomTheme({
    this.styleButton,
    this.mainTextWhite,
    this.mainTextBlack,
  });

  @override
  CustomTheme copyWith({
    ButtonStyle? styleButton,
    TextStyle? mainTextWhite,
    TextStyle? mainTextBlack,
  }) {
    return CustomTheme(
      styleButton: styleButton ?? this.styleButton,
      mainTextBlack: mainTextBlack ?? this.mainTextBlack,
    );
  }

  @override
  CustomTheme lerp(ThemeExtension<CustomTheme>? other, double t) {
    if (other is! CustomTheme) {
      return this;
    }
    return CustomTheme(
      styleButton: ButtonStyle.lerp(styleButton, other.styleButton, t),
      mainTextWhite: TextStyle.lerp(mainTextWhite, other.mainTextWhite, t),
      mainTextBlack: TextStyle.lerp(mainTextBlack, other.mainTextBlack, t),
    );
  }
}

ThemeData themeData() => ThemeData.light().copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          error: const Color.fromARGB(255, 255, 120, 120)),
      extensions: <ThemeExtension<dynamic>>[
        CustomTheme(
          styleButton: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
            elevation: 2,
            shadowColor: Colors.black
          ),
          mainTextWhite: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
          mainTextBlack: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
