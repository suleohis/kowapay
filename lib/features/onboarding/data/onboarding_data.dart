import '../../../gen/assets.gen.dart';
import '../domain/models/onboarding_model.dart';

class OnboardingRepository {
  static final List<OnboardingModel> pages = [
    OnboardingModel(
      imagePath: Assets.images.onboarding0.path,
      titleKey: 'onboarding_title_1',
      subtitleKey: 'onboarding_subtitle_1',
    ),
    OnboardingModel(
      imagePath: Assets.images.onboarding1.path,
      titleKey: 'onboarding_title_2',
      subtitleKey: 'onboarding_subtitle_2',
    ),
    OnboardingModel(
      imagePath: Assets.images.onboarding2.path,
      titleKey: 'onboarding_title_3',
      subtitleKey: 'onboarding_subtitle_3',
    ),
    OnboardingModel(
      imagePath: Assets.images.onboarding3.path,
      titleKey: 'onboarding_title_4',
      subtitleKey: 'onboarding_subtitle_4',
    ),
  ];
}