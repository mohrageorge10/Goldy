import 'package:goldy/Core/Networking/api_constants.dart';
import 'package:goldy/Core/Networking/dio_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:goldy/Features/Silver/Data/Models/silver_model.dart';

class SilverRepo {
  Future<Either<String, SilverModel>> getSilver() async {
    try {
      final res = await DioHelper.getData(endpoint: ApiConstants.silverEndpoint);
      return right(SilverModel.fromJson(res.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
