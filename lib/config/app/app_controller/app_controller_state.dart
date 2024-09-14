part of 'app_controller_cubit.dart';

class AppControllerState extends Equatable {
  const AppControllerState({
    this.selectedLocale = const Locale('en'),
    this.selectedTheme = Brightness.light,
    this.isInterNetConnection = true,
  });
  final Locale selectedLocale;
  final Brightness selectedTheme;
  final bool isInterNetConnection;
  AppControllerState copyWith({
    Locale? selectedLocale,
    Brightness? selectedTheme,
    bool? isInterNetConnection,
  }) =>
      AppControllerState(
        selectedLocale: selectedLocale ?? this.selectedLocale,
        selectedTheme: selectedTheme ?? this.selectedTheme,
        isInterNetConnection: isInterNetConnection ?? this.isInterNetConnection,
      );

  @override
  List<Object> get props => [
        selectedTheme,
        selectedLocale,
        isInterNetConnection,
      ];
}
