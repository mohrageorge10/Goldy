
import 'package:goldy/Features/Silver/Presentation/Cubit/silver_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/Features/Silver/Data/Repo/silver_repo.dart';

class SilverCubit extends Cubit<SilverState> {
  final SilverRepo silverRepo;
  SilverCubit(this.silverRepo) : super(SilverInitialState());

  Future<void> getSilver() async {
    emit(SilverLoadingState());
    final res = await silverRepo.getSilver();
    res.fold(
      (error) {
        emit(SilverErrorState(errMsg: error));
      },
      (silverModel) {
        emit(SilverSuccessState(silverModel: silverModel));
      },
    );
  }
}
