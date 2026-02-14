import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/Core/Constants/app_colors.dart';
import 'package:goldy/Core/Constants/app_images.dart';
import 'package:goldy/Core/Constants/app_strings.dart';
import 'package:goldy/Core/Widgets/app_bar_text.dart';
import 'package:goldy/Features/Gold/Data/Repo/gold_repo.dart';
import 'package:goldy/Features/Gold/Presentation/Cubit/gold_cubit.dart';
import 'package:goldy/Features/Gold/Presentation/Cubit/gold_state.dart';

class GoldPage extends StatelessWidget {
  const GoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GoldCubit(GoldRepo())..getGold();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: AppBarText(
            txt: AppStrings.goldTitle,
            color: AppColors.goldColor,
          ),
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            else if (state is GoldErrorState) {
              return Center(child: Text("Error", style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: AppColors.goldColor),));
            }
            else if(state is GoldSuccessState){
              return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.goldImage),
                  SizedBox(height: 20),
                  Text(
                    "${state.goldModel.price.toString()} USD",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.goldColor,
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
