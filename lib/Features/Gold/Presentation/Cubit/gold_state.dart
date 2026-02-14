import 'package:goldy/Features/Gold/Data/Models/gold_model.dart';

abstract class GoldState {}

class GoldInitialState extends GoldState {}

class GoldErrorState extends GoldState {
  final String errMsg;

  GoldErrorState({required this.errMsg});
}

class GoldSuccessState extends GoldState {
  final GoldModel goldModel;

  GoldSuccessState({required this.goldModel});
}

class GoldLoadingState extends GoldState {}
