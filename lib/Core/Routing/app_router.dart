import 'package:flutter/material.dart';
import 'package:goldy/Core/Presentation/home_screen.dart';
import 'package:goldy/Core/Routing/app_routes.dart';
import 'package:goldy/Features/Gold/Presentation/Screens/gold_page.dart';
import 'package:goldy/Features/Silver/Presentation/Screens/silver_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoutes.gold:
        return MaterialPageRoute(builder: (context) => GoldPage());
      case AppRoutes.silver:
        return MaterialPageRoute(builder: (context) => SilverPage());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
