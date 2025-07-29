import 'package:dio/dio.dart';

class DioClient {

  late final Dio dio;

  DioClient() {
    const String baseUrl = "https://pokeapi.co/api/v2";
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 10),
    ));
  }
}