import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kowapay/core/extensions/localization_extension.dart';
import 'package:kowapay/core/theme/app_text_styles.dart';

import '../../../../generated/app_localizations.dart';
import '../../domain/models/onboarding_model.dart';

class OnboardingPageView extends StatelessWidget {
  final OnboardingModel page;
  const OnboardingPageView({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Image.asset(page.imagePath, fit: BoxFit.fill),
        ),
        SizedBox(height: 60.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Text(
                l10n.tr(page.titleKey),
                textAlign: TextAlign.center,
                style: AppTextStyles.h1(context).copyWith(
                  fontSize: 32.sp
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                l10n.tr(page.subtitleKey),
                textAlign: TextAlign.center,
                style: AppTextStyles.body(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}