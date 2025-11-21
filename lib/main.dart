import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kowapay/routes/app_router.dart';
import 'core/di/initialize_providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'generated/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await initializeProviders(container);
  runApp(UncontrolledProviderScope(
      container: container,
      child: MyFintechApp()));
}

class MyFintechApp extends ConsumerWidget {
  const MyFintechApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(390, 852),

      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp.router(
        routerConfig: ref.watch(routerProvider),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
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
        builder: (context, widget) {
          return ResponsiveScaledBox(
            child: widget!,
          );
        },
        theme: ThemeData(useMaterial3: true),
      ),
    );
  }
}


class ResponsiveScaledBox extends StatelessWidget {
  final Widget child;

  const ResponsiveScaledBox({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 600) {
      // Tablet or larger → limit max width and center
      return Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: child,
        ),
      );
    }

    return child;
  }
}