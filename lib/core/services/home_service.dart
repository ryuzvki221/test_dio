import 'package:dio/dio.dart';
import 'package:test_dio/core/models/responses/responses.dart';
import 'package:test_dio/core/network/api.dart';
import 'package:test_dio/core/network/endpoints.dart';

class HomeService {
  final _api = Api();

  Future<Response> fetch() async {
    try {
      return await _api.get(Endpoints.test);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> create(Map<String, dynamic> data) async {
    try {
      return await _api.post(Endpoints.test, data);
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> modify(String id, Map<String, dynamic> data) async {
    try {
      return await _api.put('${Endpoints.test}/$id', data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String id) async {
    try {
      return await _api.delete('${Endpoints.test}/$id');
    } catch (e) {
      rethrow;
    }
  }
}


final homeService = HomeService();
