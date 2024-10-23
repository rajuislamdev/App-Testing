import 'package:app_test/views/authentication/login_screen.dart';
import 'package:app_test/views/authentication/sign_up_screen.dart';
import 'package:app_test/views/profile/profile_screen.dart';
import 'package:app_test/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  static const String splash = '/';
  static const String signUpScreen = '/signUp';
  static const String loginScreen = '/login';
  static const String thirdScreen = '/third';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signUpScreen:
        return _buildRouteWithAnimation(const SignUpScreen());
      case loginScreen:
        return _buildRouteWithAnimation(const LoginScreen());
      case thirdScreen:
        return _buildRouteWithAnimation(const ProfileScreen());
      default:
        debugPrint('Unknown route: ${settings.name}');
        return MaterialPageRoute(builder: (_) => SizedBox());
    }
  }

  // Custom method for navigation animation using PageRouteBuilder
  static PageRouteBuilder<dynamic> _buildRouteWithAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween<Offset>(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
