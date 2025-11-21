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
}
