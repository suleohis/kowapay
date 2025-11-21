import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kowapay/core/theme/app_colors.dart';
import 'package:kowapay/core/theme/app_text_styles.dart';
import 'package:kowapay/routes/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/secure_storage_service.dart';
import '../../../../generated/app_localizations.dart';
import '../../data/onboarding_data.dart';
import '../widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Gradient Circle Background
          Column(
            children: [
              // SafeArea(
              //   child: Align(
              //     alignment: Alignment.topRight,
              //     child: TextButton(
              //       onPressed: () => context.go(AppRouter.login),
              //       child: Text(l10n.skip, style: TextStyle(color: Colors.white70, fontSize: 16.sp)),
              //     ),
              //   ),
              // ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: OnboardingRepository.pages.length,
                  onPageChanged: (i) => setState(() => _currentIndex = i),
                  itemBuilder: (context, index) {
                    return OnboardingPageView(
                      page: OnboardingRepository.pages[index],
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 60.h),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 94,
                      width: 94,
                      child: CircularProgressIndicator(
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                        value:( _currentIndex / 4 ) + 0.25,
                      ),
                    ),
                    SizedBox(
                      height:
                          _currentIndex == OnboardingRepository.pages.length - 1
                          ? 94.h
                          : 62.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_currentIndex ==
                              OnboardingRepository.pages.length - 1) {
                            // Save that user has seen onboarding
                            await SecureStorageService.instance
                                .setOnboardingSeen();
                            context.go(AppRouter.login);
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.ease,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A3C40),
                          shape: const CircleBorder(),
                        ),
                        child:
                            _currentIndex ==
                                OnboardingRepository.pages.length - 1
                            ? Text(
                                l10n.get_started,
                                style: AppTextStyles.body(
                                  context,
                                ).copyWith(color: AppColors.onPrimary),
                              )
                            : Icon(
                                Icons.arrow_forward,
                                size: 24.sp,
                                color: AppColors.onPrimary,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
