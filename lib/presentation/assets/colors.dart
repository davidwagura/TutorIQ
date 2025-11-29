import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  // Primary Colors
  static const Color primaryPurple = Color(0xFF6B46C1);
  static const Color deepPurple = Color(0xFF5D3FD3);
  static const Color lightPurple = Color(0xFFEDE7F6);

  // Secondary Colors
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color infoBlue = Color(0xFF17A2B8);
  static const Color skyBlue = Color(0xFF87CEEB);

  // Success Colors
  static const Color successGreen = Color(0xFF28A745);
  static const Color emeraldGreen = Color(0xFF10B981);
  static const Color lightGreen = Color(0xFFD1FAE5);

  // Warning Colors
  static const Color warningYellow = Color(0xFFFFC107);
  static const Color amber = Color(0xFFFFB300);
  static const Color lightYellow = Color(0xFFFEF3C7);

  // Error Colors
  static const Color errorRed = Color(0xFFDC3545);
  static const Color crimsonRed = Color(0xFFEF4444);
  static const Color lightRed = Color(0xFFFEE2E2);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF8F9FA);
  static const Color mediumGrey = Color(0xFFE9ECEF);
  static const Color darkGrey = Color(0xFF6C757D);
  static const Color charcoal = Color(0xFF343A40);
  static const Color black = Color(0xFF000000);

  // Text Colors
  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF495057);
  static const Color textTertiary = Color(0xFF6C757D);
  static const Color textLight = Color(0xFFADB5BD);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF212529);

  // Border Colors
  static const Color borderLight = Color(0xFFDEE2E6);
  static const Color borderDark = Color(0xFFADB5BD);

  // Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [primaryPurple, deepPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient successGradient = LinearGradient(
    colors: [successGreen, emeraldGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient warningGradient = LinearGradient(
    colors: [warningYellow, amber],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient infoGradient = LinearGradient(
    colors: [infoBlue, primaryBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Social Colors
  static const Color facebookBlue = Color(0xFF1877F2);
  static const Color twitterBlue = Color(0xFF1DA1F2);
  static const Color googleRed = Color(0xFFDB4437);
  static const Color linkedInBlue = Color(0xFF0A66C2);

  // Status Colors
  static const Color liveColor = Color(0xFF00D1B2);
  static const Color offlineColor = Color(0xFF6C757D);
  static const Color busyColor = Color(0xFFFF3860);

  // Additional UI Colors
  static const Color shadowColor = Color(0x1A000000);
  static const Color overlayColor = Color(0x66000000);
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
}
