import 'package:flutter/material.dart';

@immutable
class AppColors {
  const AppColors._();

  // Primary Brand
  static const primary = Color(0xFF003439);
  static const onPrimary = Color(0xFFFFFFFF);

  // Secondary
  static const secondary = Color(0xFF2A8080);
  static const onSecondary = Color(0xFFFFFFFF);

  // Text
  static const textPrimary = Color(0xFF000C0E);
  static const textSecondary = Color(0xFF344054);

  // SUCCESS / ERROR STATES
  static const success = Color(0xFF039855);
  static const successContainer = Color(0xFFA6F4C5);
  static const error = Color(0xFFB00020);
  static const errorContainer = Color(0xFFFFDAD6);
}