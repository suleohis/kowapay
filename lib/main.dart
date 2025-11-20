import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kowapay/routes/app_router.dart';
import 'core/responsive.dart';
import 'generated/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyFintechApp()));
}

class MyFintechApp extends ConsumerWidget {
  const MyFintechApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('ig'),
        Locale('ha'),
        Locale('yo'),
      ],
      locale: const Locale('en'), // TODO: make dynamic from user settings
      builder: (context, child) {
        initResponsive(context);
        return child!;
      },
      theme: ThemeData(useMaterial3: true),
    );
  }
}