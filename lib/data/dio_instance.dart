import 'package:dio/dio.dart';

final dio = Dio(); // With default `Options`.

Dio configureDio() {

  final options = BaseOptions(
    baseUrl: 'http://192.168.226.175:3030/',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  final dio = Dio(options);

  return dio;
}