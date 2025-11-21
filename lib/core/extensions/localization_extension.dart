// core/extensions/localization_extension.dart

import '../../generated/app_localizations.dart';

extension LocalizationX on S {
  String tr(String key) {
    return switch (key) {
      'onboarding_title_1' => onboarding_title_1,
      'onboarding_subtitle_1' => onboarding_subtitle_1,
      'onboarding_title_2' => onboarding_title_2,
      'onboarding_subtitle_2' => onboarding_subtitle_2,
      'onboarding_title_3' => onboarding_title_3,
      'onboarding_subtitle_3' => onboarding_subtitle_3,
      'onboarding_title_4' => onboarding_title_4,
      'onboarding_subtitle_4' => onboarding_subtitle_4,
      'skip' => skip,
      'get_started' => get_started,
      _ => key, // fallback
    };
  }
}