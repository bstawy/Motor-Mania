import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../constants/app_constant_keys.dart';

class LanguageCubit extends HydratedCubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  void setLanguage(Locale locale) => emit(locale);

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    final String languageCode =
        json[CachingKeys.userLanguage] as String? ?? 'en';

    final Locale appLanguage = Locale(languageCode);

    return appLanguage;
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {CachingKeys.userLanguage: state.languageCode};
  }
}
