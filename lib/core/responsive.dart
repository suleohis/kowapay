import 'package:flutter/material.dart';

/// Call ONCE in main() or in MaterialApp builder
void initResponsive(BuildContext context) {
  Responsive._context = context;
  Responsive._design = const Size(375, 812); // iPhone 13/14 – industry standard
}

/// Make every number responsive with beautiful syntax
extension ResponsiveNum on num {
  static BuildContext? _ctx;

  BuildContext get c => _ctx ?? (throw Exception('Call initResponsive(context) first!'));

  /// Width (horizontal)
  double get w => (this / 375) * MediaQuery.of(c).size.width;

  /// Height (vertical)
  double get h => (this / 812) * MediaQuery.of(c).size.height;

  /// Font size – respects user text settings + clamped for accessibility
  double get sp {
    final base = (this / 375) * MediaQuery.of(c).size.width;
    final scaler = MediaQuery.of(c).textScaler;
    return scaler
        .clamp(minScaleFactor: 0.85, maxScaleFactor: 1.5)
        .scale(base);
  }

  // ──────────────────────────────────────────────
  // BEAUTIFUL PRESET SIZES – what you asked for!
  // ──────────────────────────────────────────────
  double get xs  => sp * 0.70;   // 10–12
  double get s   => sp * 0.85;   // 12–14
  double get m   => sp * 1.0;    // 14–16   ← default body
  double get l   => sp * 1.15;   // 16–18
  double get xl  => sp * 1.40;   // 20–24
  double get xxl => sp * 1.75;   // 28–32   ← headlines
  double get huge=> sp * 2.20;   // 36–48   ← hero amounts
}

/// Global access (you'll love this)
class Responsive {
  static late Size _design;
  static BuildContext? _context;

  // Shortcuts – even cleaner
  static double w(double value) => value.w;
  static double h(double value) => value.h;
  static double sp(double value) => value.sp;

  // Presets
  static double get s  => 14.sp;
  static double get m  => 16.sp;
  static double get l  => 18.sp;
  static double get xl => 24.sp;
}