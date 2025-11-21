// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class SFr extends S {
  SFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'KowaPay';

  @override
  String get splashNote => 'Save. Spend. Grow';

  @override
  String get welcome => 'Bienvenue';

  @override
  String get balance => 'Solde disponible';

  @override
  String get loginBiometric => 'Connexion par empreinte/faciale';

  @override
  String get transfer => 'Transférer';

  @override
  String get amount => 'Montant';

  @override
  String get logout => 'Déconnexion';

  @override
  String get kycPending => 'Terminez votre KYC pour continuer';

  @override
  String currency(Object amount) {
    return '$amount FCFA';
  }
}
