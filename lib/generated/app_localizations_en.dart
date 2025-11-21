// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'KowaPay';

  @override
  String get splashNote => 'Save. Spend. Grow';

  @override
  String get welcome => 'Welcome back';

  @override
  String get balance => 'Available Balance';

  @override
  String get loginBiometric => 'Login with Fingerprint/Face ID';

  @override
  String get transfer => 'Transfer';

  @override
  String get amount => 'Amount';

  @override
  String get logout => 'Logout';

  @override
  String get kycPending => 'Complete your KYC to continue';

  @override
  String currency(Object amount) {
    return '₦$amount';
  }
}
