// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kowapay/core/extensions.dart';
import 'package:kowapay/core/theme/app_text_styles.dart';
import 'package:kowapay/gen/assets.gen.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/app_localizations.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (previous, next) {
      if (next.user != null) context.go('/dashboard');
      else if ( next.user == null) context.go('/login');
    });

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