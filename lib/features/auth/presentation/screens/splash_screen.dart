import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kowapay/core/theme/app_text_styles.dart';
import 'package:kowapay/gen/assets.gen.dart';
import 'package:kowapay/routes/app_router.dart';

import '../../../../core/services/secure_storage_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/app_localizations.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final GoRouter _router;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _router = GoRouter.of(context);
  }

  @override
  void initState() {
    super.initState();
    _decideInitialRoute();
  }

  Future<void> _decideInitialRoute() async {
    final hasSeenOnboarding =
    await SecureStorageService.instance.hasSeenOnboarding();

    if (hasSeenOnboarding) {
      // final auth = ref.read(authProvider.notifier);
      // await auth.loginWithBiometrics();
    }
    if (!mounted) return;

    final authState = ref.read(authProvider);

    if (!hasSeenOnboarding) {
      _router.replace(AppRouter.onboarding);
    } else if (authState.user != null) {
      _router.replace(AppRouter.dashboard);
    } else {
      _router.replace(AppRouter.login);
    }
  }

  @override
  Widget build(BuildContext context,) {

    // Auto attempt biometric
    // Future.microtask(() => ref.read(authProvider.notifier).loginWithBiometrics());

    return Scaffold(body:Container(
      color: AppColors.primary,
      child: Stack(
        fit: StackFit.expand,
        children: [
         Container(
           alignment: Alignment.center,
           margin: EdgeInsets.only(top: 92.h, bottom: 34.h),
           child: Assets.images.splashBg.image(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             fit: BoxFit.fill
           ),
         ),
          Center(
            child: Assets.branding.logo.svg(
              width: 344.w,
              height: 100.h
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Text(
                  S.of(context).splashNote,
                style: AppTextStyles.bodyLarge(context).copyWith(
                  color: AppColors.onPrimary,
                  fontSize: 24.sp
                ),
              ),
            ),
          )
        ],
      )
    ));
  }
}