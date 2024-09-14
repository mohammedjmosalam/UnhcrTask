import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:template_project/config/routes/app_route.dart';
import 'package:template_project/core/utilities/extension/context_extension.dart';

part 'app_controller_state.dart';

class AppControllerCubit extends Cubit<AppControllerState> {
  final BuildContext context;
  BuildContext? contextMain;
  StreamSubscription<List<ConnectivityResult>>? listener;
  AppControllerCubit({
    required this.context,
  }) : super(const AppControllerState()) {
    interNetChecker();
    initSettings();
  }
  Future<void> initSettings() async {
    String? lang = await context.sharePreference.getLang();
    int? theme = await context.sharePreference.getTheme();
    Locale langSelected = Locale(lang ?? 'en');
    Brightness themeSelected = Brightness.values.elementAt(theme ?? 1);
    emit(state.copyWith(
      selectedLocale: langSelected,
      selectedTheme: themeSelected,
    ));
  }

  void changeLang({Locale? lang}) {
    bool isArabic = state.selectedLocale.languageCode == 'ar';
    Locale changeToLang = lang ?? (isArabic ? Locale('en') : Locale('ar'));
    context.sharePreference.setLang(lang: changeToLang);
    emit(
      state.copyWith(
        selectedLocale: changeToLang,
      ),
    );
  }

  void changeTheme({Brightness? theme}) {
    bool isDark = state.selectedTheme == Brightness.dark;
    Brightness changeToTheme =
        theme ?? (isDark ? Brightness.light : Brightness.dark);
    context.sharePreference.setTheme(theme: changeToTheme);
    emit(
      state.copyWith(
        selectedTheme: changeToTheme,
      ),
    );
  }

  Future<void> interNetChecker() async {
    reCheckConnection();
    listener = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> status) {
      bool isConnect = !status.contains(ConnectivityResult.none);
      if (!isConnect) {
        Navigator.pushNamed(
            contextMain ?? context, AppRoute.noInternetConnection);
      }
      emit(state.copyWith(
        isInterNetConnection: isConnect,
      ));
    });
  }

  @override
  Future<void> close() async {
    listener?.cancel();
    super.close();
  }

  Future<bool> reCheckConnection() async {
    List<ConnectivityResult> connectionList =
        await Connectivity().checkConnectivity();
    bool isConnect = !connectionList.contains(ConnectivityResult.none);
    emit(state.copyWith(
      isInterNetConnection: isConnect,
    ));
    return isConnect;
  }
}
