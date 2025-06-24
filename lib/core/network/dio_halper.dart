import 'package:appointments/core/utils/shared_prefrances.dart';
import 'package:dio/dio.dart';
import 'package:appointments/core/network/api_constant.dart';
import 'package:flutter/material.dart';

class DioHelper {
  DioHelper._();
  static Dio? dio;

  static Dio getDio() {
    if (dio == null)  {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiConstant.baseUrl,
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    debugPrint('Dio Base URL: ${dio!.options.baseUrl}'); // Debug print
      
      // Add interceptors for logging
      dio!.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );

      // Add retry interceptor
      dio!.interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) async {
            if (error.type == DioExceptionType.connectionTimeout ||
                error.type == DioExceptionType.receiveTimeout) {
              // Retry the request
              try {
                return handler.resolve(await dio!.fetch(error.requestOptions));
              } catch (e) {
                return handler.next(error);
              }
            }
            return handler.next(error);
          },
          onRequest: (options, handler) async {
      final token = await SharedPrefrancesHelpers.getSecuredString('tokenKey');
      debugPrint('💡 Interceptor Token: $token'); // Check this in logs
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      } else {
        debugPrint('⚠️ Token is missing or empty in Interceptor!');
      }
      return handler.next(options);
    }
        ),
      );
    }
    return dio!;
  }

  static void setHeaders() async{
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${await SharedPrefrancesHelpers.getSecuredString('tokenKey')}'
    };
  }

  static void setTokenAfterLogin(String token) {
    dio!.options.headers['Authorization'] = 'Bearer $token';
  }

  static void dispose() {
    dio?.close();
    dio = null;
  }
}