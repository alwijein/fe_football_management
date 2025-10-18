import 'package:flutter/material.dart';

class ColorSchemaCollections {
  static const PrimaryColors primary = PrimaryColors();
  static const GrayColors gray = GrayColors();
  static const ErrorColors error = ErrorColors();
  static const WarningColors warning = WarningColors();
  static const SuccessColors success = SuccessColors();
  static const BlueColors blue = BlueColors();

  // gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFF63D68), Color(0xFFD42D58)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [Color(0xFF1F2137), Color(0xFF181928)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class PrimaryColors {
  const PrimaryColors();

  final Color primary = const Color(0xFFF63D68); // pink/red untuk button
  final Color accent = const Color(0xFFFF5278); // lighter pink
  final Color scaffold = const Color(0xFF181928); // background utama
  final Color secondary = const Color(0xFFFFB800); // kuning untuk aksen
  final Color body = const Color(0xFFFFFFFF); // text putih untuk dark theme
  final Color muted = const Color(0xFF8B8D9C); // text abu-abu
  final Color placeholder = const Color(0xFF6B6D7C); // placeholder text
  final Color disabled = const Color(0xFFDADADA); // disabled state
  final Color border = const Color(0xFF2F3348); // border
  final Color light = const Color(0xFFFFF0F3); // light pink
  final Color overlay = const Color(0xFF0D0E16); // overlay gelap
  final Color white = const Color(0xFFFEFEFE);
  final Color black = const Color(0xFF0A0B14);
  final Color card = const Color(0xFF1F2137); // card background
  final Color surface = const Color(0xFF252842); // surface color
}

class GrayColors {
  const GrayColors();

  final Color gray50 = const Color(0xFFF9FAFB);
  final Color gray100 = const Color(0xFFE5E7EB);
  final Color gray200 = const Color(0xFFD1D5DB);
  final Color gray300 = const Color(0xFFB4B8C0);
  final Color gray400 = const Color(0xFF8B8D9C);
  final Color gray500 = const Color(0xFF6B6D7C);
  final Color gray600 = const Color(0xFF4B4D5C);
  final Color gray700 = const Color(0xFF353745);
  final Color gray800 = const Color(0xFF252842);
  final Color gray900 = const Color(0xFF1F2137);
  final Color gray1000 = const Color(0xFF181928);
}

class ErrorColors {
  const ErrorColors();

  final Color light = const Color(0xFFFEE2E2);
  final Color defaultColor = const Color(0xFFEF4444);
  final Color dark = const Color(0xFFB91C1C);
  final Color darkMuted = const Color(0xFF7F1D1D);
}

class WarningColors {
  const WarningColors();

  final Color light = const Color(0xFFFEF3C7);
  final Color defaultColor = const Color(0xFFF59E0B);
  final Color dark = const Color(0xFFD97706);
}

class SuccessColors {
  const SuccessColors();

  final Color light = const Color(0xFFD1FAE5);
  final Color defaultColor = const Color(0xFF10B981);
  final Color dark = const Color(0xFF059669);
}

class BlueColors {
  const BlueColors();

  final Color light = const Color(0xFFDBEAFE);
  final Color defaultColor = const Color(0xFF3B82F6);
  final Color dark = const Color(0xFF1E40AF);
}
