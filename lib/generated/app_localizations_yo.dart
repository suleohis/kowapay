// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yoruba (`yo`).
class SYo extends S {
  SYo([String locale = 'yo']) : super(locale);

  @override
  String get appName => 'KowaPay';

  @override
  String get splashNote => 'Save. Spend. Grow';

  @override
  String get welcome => 'Ẹ káàbọ̀';

  @override
  String get balance => 'Ìsanwó tó ṣẹ́wà';

  @override
  String get loginBiometric => 'Wọlé pẹ̀lú ìtọ́ka ẹ̀ka / ojú';

  @override
  String get transfer => 'Gbé owó lọ';

  @override
  String get amount => 'Iye owó';

  @override
  String get logout => 'Jáde';

  @override
  String get kycPending => 'Pari KYC rẹ lati tẹsiwaju';

  @override
  String currency(Object amount) {
    return '₦$amount';
  }

  @override
  String get onboarding_title_1 => 'Instant Payments,\nAnytime.';

  @override
  String get onboarding_subtitle_1 =>
      'Fast, reliable, and built for everyday life.';

  @override
  String get onboarding_title_2 => 'Save Together,\nGrow Together.';

  @override
  String get onboarding_subtitle_2 =>
      'Join trusted Ajo circles to contribute and save';

  @override
  String get onboarding_title_3 => 'Safe. Secure.\nTrusted.';

  @override
  String get onboarding_subtitle_3 => 'Built with your peace of mind in mind';

  @override
  String get onboarding_title_4 => 'More Than a\nWallet.';

  @override
  String get onboarding_subtitle_4 => 'Send, save, and grow your money';

  @override
  String get skip => 'Skip';

  @override
  String get get_started => 'Get Started';
}
