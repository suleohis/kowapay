// lib/core/theme/app_text_styles.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

@immutable
class AppTextStyles {
  const AppTextStyles._();

  // Private base styles (non-responsive)
  static const _h1 = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.2, letterSpacing: -0.5);
  static const _h2 = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.25);
  static const _h3 = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.3);
  static const _h4 = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.4);
  static const _bodyLarge = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.5);
  static const _body = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.5);
  static const _bodyMedium = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.5);
  static const _bodySmall = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.45);
  static const _caption = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.4);
  static const _button = TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.5, letterSpacing: 0.2);

  // RESPONSIVE TEXT STYLES — This is the magic
  static TextStyle h1(BuildContext context) => _h1.copyWith(
    fontSize: _scale(context, mobile: 28, tablet: 32, desktop: 36),
    color: AppColors.textPrimary,
  );

  static TextStyle h2(BuildContext context) => _h2.copyWith(
    fontSize: _scale(context, mobile: 24, tablet: 28, desktop: 32),
    color: AppColors.textPrimary,
  );

  static TextStyle h3(BuildContext context) => _h3.copyWith(
    fontSize: _scale(context, mobile: 22, tablet: 24, desktop: 26),
    color: AppColors.textPrimary,
  );

  static TextStyle h4(BuildContext context) => _h4.copyWith(
    fontSize: _scale(context, mobile: 18, tablet: 20, desktop: 22),
    color: AppColors.textPrimary,
  );

  static TextStyle bodyLarge(BuildContext context) => _bodyLarge.copyWith(
    fontSize: _scale(context, mobile: 16, tablet: 17, desktop: 18),
    color: AppColors.textPrimary,
  );

  static TextStyle body(BuildContext context) => _body.copyWith(
    fontSize: _scale(context, mobile: 15, tablet: 16, desktop: 17),
    color: AppColors.textPrimary,
  );

  static TextStyle bodySmall(BuildContext context) => _bodySmall.copyWith(
    fontSize: _scale(context, mobile: 13, tablet: 14, desktop: 15),
    color: AppColors.textSecondary,
  );

  static TextStyle caption(BuildContext context) => _caption.copyWith(
    fontSize: _scale(context, mobile: 12, tablet: 13, desktop: 14),
    color: AppColors.textSecondary,
  );

  static TextStyle button(BuildContext context) => _button.copyWith(
    fontSize: _scale(context, mobile: 15, tablet: 16, desktop: 17),
    color: Colors.white,
  );

  static TextStyle amountLarge(BuildContext context, double amount) => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.1,
    fontSize: _scale(context, mobile: 32, tablet: 36, desktop: 42),
    color: amount < 0 ? AppColors.error : AppColors.textPrimary,
  );

  static TextStyle amountMedium(BuildContext context) => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontSize: _scale(context, mobile: 26, tablet: 28, desktop: 30),
    color: AppColors.textPrimary,
  );

  // Transaction styles
  static TextStyle transactionTitle(BuildContext context) => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: _scale(context, mobile: 15, tablet: 16, desktop: 17),
    color: AppColors.textPrimary,
  );

  static TextStyle transactionAmount(BuildContext context, double amount) => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: _scale(context, mobile: 15, tablet: 16, desktop: 17),
    color: amount >= 0 ? AppColors.success : AppColors.error,
  );
}

// PRIVATE SCALING LOGIC — Used by every top app
double _scale(BuildContext context, {required double mobile, double? tablet, double? desktop}) {
  final width = MediaQuery.of(context).size.width;

  if (width >= 1200) return desktop ?? tablet ?? mobile;
  if (width >= 600) return tablet ?? mobile;
  return mobile;
}