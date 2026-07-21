import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color inkNavy = Color(0xFF16243A);
  static const Color warmPaper = Color(0xFFF7F2E9);
  static const Color marigold = Color(0xFFE8A33D);
  static const Color passportTeal = Color(0xFF3F8577);
  static const Color brick = Color(0xFFC0503E);
  static const Color offWhite = Color(0xFFEDEAE2);

  // Semantic aliases — use these in screens, not raw colors above
  static const Color background = inkNavy;
  static const Color surface = warmPaper;
  static const Color primaryAccent = marigold;
  static const Color positive = passportTeal;
  static const Color negative = brick;
  static const Color textOnDark = offWhite;
  static const Color textOnLight = inkNavy;
}
