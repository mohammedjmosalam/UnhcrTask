import 'package:flutter/material.dart';
import 'package:template_project/config/routes/app_route.dart';
import 'package:template_project/core/screens/no_internet_conecction/no_internet_screen.dart';
import 'package:template_project/data/model/job_model.dart';
import 'package:template_project/feature/home/home.dart';
import 'package:template_project/feature/job_page/job_page.dart';
import 'package:template_project/feature/splash_screen/splash_screen.dart';

class GenerateRoute {
  Route _createAnimationRoute({
    required Widget newPage,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => newPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.linear;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashScreen(),
        );
      case AppRoute.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Home(),
        );
      case AppRoute.noInternetConnection:
        return _createAnimationRoute(
          settings: settings,
          newPage: const NoInternetConnectionScreen(),
        );
      case AppRoute.jobPage:
        return _createAnimationRoute(
          settings: settings,
          newPage: JobPage(
            jobModel: settings.arguments as JobModel,
          ),
        );

      default:
    }
    return null;
  }
}
