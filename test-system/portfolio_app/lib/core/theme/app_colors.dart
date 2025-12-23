import 'package:flutter/material.dart';

/// MCP-2099 Portfolio Color Palette
/// Retro-futuristic / Cyberpunk aesthetic
class AppColors {
  AppColors._();

  // ============================================
  // DARK MODE (Primary Theme)
  // ============================================

  /// Deep Space Black - Primary background
  static const Color deepSpaceBlack = Color(0xFF0A0A0F);

  /// Neon Cyan - Primary accent, highlights, interactive elements
  static const Color neonCyan = Color(0xFF00E5FF);

  /// Neon Purple - Secondary accent, gradients
  static const Color neonPurple = Color(0xFFB388FF);

  /// Accent Cyan - Lighter cyan for subtle accents
  static const Color accentCyan = Color(0xFF80DEEA);

  /// Dark surface color for cards, containers
  static const Color darkSurface = Color(0xFF121218);

  /// Slightly lighter surface for elevated elements
  static const Color darkSurfaceElevated = Color(0xFF1A1A22);

  /// Text colors for dark mode
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textMuted = Color(0xFF6B6B6B);

  // ============================================
  // LIGHT MODE (Optional)
  // ============================================

  /// Stark White - Light mode background
  static const Color starkWhite = Color(0xFFF5F5F7);

  /// Technical Blue - Light mode accent
  static const Color technicalBlue = Color(0xFF2962FF);

  /// Subtle Gray - Light mode surfaces
  static const Color subtleGray = Color(0xFFECEFF1);

  // ============================================
  // GRADIENTS
  // ============================================

  /// Primary neon gradient (Cyan → Purple)
  static const LinearGradient neonGradient = LinearGradient(
    colors: [neonCyan, neonPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Horizontal neon gradient
  static const LinearGradient neonGradientHorizontal = LinearGradient(
    colors: [neonCyan, neonPurple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Dark gradient for backgrounds
  static const LinearGradient darkGradient = LinearGradient(
    colors: [deepSpaceBlack, Color(0xFF0D0D15), Color(0xFF12121A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Glass card gradient overlay
  static LinearGradient glassGradient = LinearGradient(
    colors: [
      Colors.white.withValues(alpha: 0.1),
      Colors.white.withValues(alpha: 0.05),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============================================
  // HELPER METHODS
  // ============================================

  /// Get neon glow shadow for glowing effects
  static List<BoxShadow> neonGlow({
    Color color = neonCyan,
    double blurRadius = 20,
    double spreadRadius = 2,
    double opacity = 0.5,
  }) {
    return [
      BoxShadow(
        color: color.withValues(alpha: opacity),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    ];
  }

  /// Get border color with opacity for glass effects
  static Color glassBorder({double opacity = 0.3}) {
    return neonCyan.withValues(alpha: opacity);
  }
}
