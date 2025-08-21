import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Colors.white; // Changed from 0xFF4285F4 to white
  static const Color onPrimary =
      Colors.black; // Changed from Colors.white to black for contrast

  // Secondary
  static const Color secondary = Color(0xFF34A853); // Google Green
  static const Color onSecondary = Colors.white;

  // Tertiary
  static const Color tertiary = Color(0xFFFBBC05); // Google Yellow
  static const Color onTertiary = Colors.black;

  // Error
  static const Color error = Color(0xFFEA4335); // Google Red
  static const Color onError = Colors.white;

  // Surface
  static const Color surface = Colors.white;
  static const Color onSurface = Colors.black;

  // Background
  static const Color background = Color(0xFFF8F9FA); // Light Grey
  static const Color onBackground = Colors.black;

  // Text Colors
  static const Color textPrimary = Color(0xFF202124);
  static const Color textSecondary = Color(0xFF5F6368);
  static const Color textTertiary = Colors.grey;

  // Border Colors
  static const Color borderPrimary = Color(0xFFE0E0E0);
  static const Color borderSecondary = Color(0xFFBDBDBD);

  // Other Colors
  static const Color success = Color(0xFF34A853);
  static const Color warning = Color(0xFFFBBC05);
  static const Color info = Color(0xFF4285F4);

  static const Color paidGreen = Color(0xFF34A853);
  static const Color paidGreenBackground = Color(0xFFE6F4EA);
  static const Color pendingOrange = Color(0xFFFBBC04);
  static const Color pendingOrangeBackground = Color(0xFFFFF8E1);
  static const Color failedRed = Color(0xFFEA4335);
  static const Color failedRedBackground = Color(0xFFFFEBEE);
  static const Color deliveredGreen = Color(0xFF34A853);
  static const Color deliveredGreenBackground = Color(0xFFE6F4EA);
  static const Color shippedBlue = Color(0xFF4285F4);
  static const Color shippedBlueBackground = Color(0xFFE3F2FD);
  static const Color cancelledRed = Color(0xFFEA4335);
  static const Color cancelledRedBackground = Color(0xFFFFEBEE);
}
