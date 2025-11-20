// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hausa (`ha`).
class AppLocalizationsHa extends AppLocalizations {
  AppLocalizationsHa([String locale = 'ha']) : super(locale);

  @override
  String get appName => 'MyFintech';

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
}
