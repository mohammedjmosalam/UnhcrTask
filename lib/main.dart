import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_project/config/app/app_controller/app_controller_cubit.dart';
import 'package:template_project/config/app/service/app_size.dart';
import 'package:template_project/config/routes/generate_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template_project/data/local/shared_preference/shared_prefrence.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.appWidth = MediaQuery.sizeOf(context).width;
    AppSize.appHeight = MediaQuery.sizeOf(context).height;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SharedPreferenceApp>(
          create: (context) => SharedPreferenceApp()..init(),
        ),
      ],
      child: Builder(
        builder: (contextBuilder) {
          return BlocProvider<AppControllerCubit>(
            create: (contextB) => AppControllerCubit(
              context: contextBuilder,
            ),
            child: BlocBuilder<AppControllerCubit, AppControllerState>(
              buildWhen: (previous, current) =>
                  previous.selectedLocale != current.selectedLocale ||
                  previous.selectedTheme != current.selectedTheme,
              builder: (context, state) {
                return MaterialApp(
                  locale: state.selectedLocale,
                  theme: ThemeData(
                    brightness: state.selectedTheme,
                  ),
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: GenerateRoute().generateRoute,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
