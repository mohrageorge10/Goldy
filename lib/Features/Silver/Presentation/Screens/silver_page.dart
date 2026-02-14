import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/Core/Constants/app_colors.dart';
import 'package:goldy/Core/Constants/app_images.dart';
import 'package:goldy/Core/Constants/app_strings.dart';
import 'package:goldy/Core/Widgets/app_bar_text.dart';
import 'package:goldy/Features/Silver/Data/Repo/silver_repo.dart';
import 'package:goldy/Features/Silver/Presentation/Cubit/silver_cubit.dart';
import 'package:goldy/Features/Silver/Presentation/Cubit/silver_state.dart';

class SilverPage extends StatelessWidget {
  const SilverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SilverCubit(SilverRepo())..getSilver();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: AppBarText(
            txt: AppStrings.silverTitle,
            color: AppColors.silverColor,
          ),
        ),
        body: BlocBuilder<SilverCubit, SilverState>(
          builder: (context, state) {
            if (state is SilverLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SilverErrorState) {
              return Center(child: Text("Error", style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: AppColors.silverColor),));
            }
            else if (state is SilverSuccessState){
              return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.silverImage),
                  SizedBox(height: 20),
                  Text(
                    "${state.silverModel.price.toString()} USD",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.silverColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
