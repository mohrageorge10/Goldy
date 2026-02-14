import 'package:goldy/Features/Gold/Data/Repo/gold_repo.dart';
import 'package:goldy/Features/Gold/Presentation/Cubit/gold_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRepo goldRepo;
  GoldCubit(this.goldRepo) : super(GoldInitialState());

  Future<void> getGold() async {
    emit(GoldLoadingState());
    final res = await goldRepo.getGold();
    res.fold(
      (error) {
        emit(GoldErrorState(errMsg: error));
      },
      (goldModel) {
        emit(GoldSuccessState(goldModel: goldModel));
      },
    );
  }
}
