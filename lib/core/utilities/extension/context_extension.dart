import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_project/config/app/app_controller/app_controller_cubit.dart';
import 'package:template_project/core/utilities/assets/app_assets.dart';
import 'package:template_project/data/local/shared_preference/shared_prefrence.dart';

extension AppContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  SharedPreferenceApp get sharePreference => read<SharedPreferenceApp>();
  AppControllerCubit get appController => read<AppControllerCubit>();
  AppLocalizations get lang => AppLocalizations.of(this)!;
  T getValueBaseOnLang<T>(
      {required T valueIsArabic, required T valueIsEnglish}) {
    switch (lang.localeName) {
      case 'ar':
        return valueIsArabic;
      case 'en':
        return valueIsEnglish;

      default:
        return valueIsArabic;
    }
  }

  String get fontBaseOnLang => getValueBaseOnLang(
        valueIsArabic: AppAssets.fonts.arabicFont,
        valueIsEnglish: AppAssets.fonts.englishFont,
      );
}
