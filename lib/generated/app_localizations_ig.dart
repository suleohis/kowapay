// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Igbo (`ig`).
class SIg extends S {
  SIg([String locale = 'ig']) : super(locale);

  @override
  String get appName => 'KowaPay';

  @override
  String get splashNote => 'Save. Spend. Grow';

  @override
  String get welcome => 'Ndewo';

  @override
  String get balance => 'Ego dị';

  @override
  String get loginBiometric => 'Banye site na mkpisiaka aka / ihu';

  @override
  String get transfer => 'Ziga ego';

  @override
  String get amount => 'Ọnụ ego';

  @override
  String get logout => 'Pụọ';

  @override
  String get kycPending => 'Mecha KYC gị iji gaa n\'ihu';

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
