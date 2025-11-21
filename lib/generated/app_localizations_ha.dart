// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hausa (`ha`).
class SHa extends S {
  SHa([String locale = 'ha']) : super(locale);

  @override
  String get appName => 'KowaPay';

  @override
  String get splashNote => 'Save. Spend. Grow';

  @override
  String get welcome => 'Barka da zuwa';

  @override
  String get balance => 'Kuɗi mai samuwa';

  @override
  String get loginBiometric => 'Shiga da yatsa / fuska';

  @override
  String get transfer => 'Canja wuri';

  @override
  String get amount => 'Adadin';

  @override
  String get logout => 'Fita';

  @override
  String get kycPending => 'Kammala KYC don ci gaba';

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
