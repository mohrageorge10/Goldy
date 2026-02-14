import 'package:flutter/material.dart';
import 'package:goldy/Core/Networking/dio_helper.dart';
import 'package:goldy/Core/Routing/app_router.dart';
import 'package:goldy/Core/Routing/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter().generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
