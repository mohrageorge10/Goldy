import 'package:flutter/material.dart';
import 'package:goldy/Core/Constants/app_colors.dart';
import 'package:goldy/Core/Constants/app_strings.dart';
import 'package:goldy/Core/Routing/app_routes.dart';
import 'package:goldy/Core/Widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: AppStrings.gold,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.gold);
              },
              color: AppColors.goldColor,
            ),
            SizedBox(height: 50),
            CustomButton(
              text: AppStrings.silver,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.silver);
              },
              color: AppColors.silverColor,
            ),
          ],
        ),
      ),
    );
  }
}
