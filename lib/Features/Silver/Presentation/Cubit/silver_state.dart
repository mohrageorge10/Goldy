
import 'package:goldy/Features/Silver/Data/Models/silver_model.dart';

abstract class SilverState {}

class SilverInitialState extends SilverState {}

class SilverErrorState extends SilverState {
  final String errMsg;

  SilverErrorState({required this.errMsg});
}

class SilverSuccessState extends SilverState {
  final SilverModel silverModel;

  SilverSuccessState({required this.silverModel});
}

class SilverLoadingState extends SilverState {}
