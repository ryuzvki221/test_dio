import 'dart:convert';

import 'package:test_dio/core/models/responses/responses.dart';
import 'package:test_dio/core/network/api.dart';
import 'package:test_dio/core/network/endpoints.dart';

class AuthService {
  final _api = Api();

  Future<DefaultResponse> registerCustomer(
      String lastname, String firstname, String phone, String? ntoken) async {
    try {
      final response = await _api.post(Endpoints.registerCustomer, {
        "lastname": lastname,
        "firstname": firstname,
        "phone": phone,
        if (ntoken != null) "notification_token": ntoken
      });
      return DefaultResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> login(String phone) async {


    Map<String, dynamic> data = {
      "phone": phone,
    };

    try {
      final response = await _api.post(Endpoints.login, data);
      return DefaultResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> verifyUser(String phone, String code) async {
    try {
      final response =
          await _api.post(Endpoints.verifyUser, {"phone": phone, "otp": code});

      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

final authService = AuthService();
