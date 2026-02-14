import 'package:dio/dio.dart';
import 'package:goldy/Core/Networking/api_constants.dart';
class DioHelper {
 static late Dio dio;
  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {"Accept":"application/json","User-Agent":"Mozilla/5.0"}
      ),
    );
  }
  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
    return response;
  }
}