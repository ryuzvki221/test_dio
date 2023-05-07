import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'interceptors/interceptors.dart';
import 'dio_exception.dart';
import 'endpoints.dart';

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = Endpoints.baseURL;
    _dio.interceptors.addAll([
      AuthorizationInterceptor(),
      LoggerInterceptor(),
    ]);
  }



  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        return response;
      } else {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Response> post(String path, Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(path, data:     <String, dynamic>{
        'phone': '777536365',
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        return response;
      } else {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioError catch (e) {
      if (kDebugMode) print(e);
      throw DioException.fromDioError(e);
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }


  Future<Response> put(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(path, data: data);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}

final api = Api();
