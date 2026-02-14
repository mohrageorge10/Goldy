import 'package:goldy/Core/Networking/api_constants.dart';
import 'package:goldy/Core/Networking/dio_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:goldy/Features/Gold/Data/Models/gold_model.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> getGold() async {
    try {
      final res = await DioHelper.getData(endpoint: ApiConstants.goldEndpoint);
      return right(GoldModel.fromJson(res.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
