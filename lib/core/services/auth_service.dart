import 'dart:ffi';

import 'package:test_dio/core/models/responses/responses.dart';
import 'package:test_dio/core/network/api.dart';
import 'package:test_dio/core/network/endpoints.dart';

class AuthService {
  final _api = Api();

  Future<AuthResponse> register(
      String name, String phone, String email, String password, String? ntoken) async {

    String createFirstname() {
      Set<String> firstname = {};
      for (int i = 0; i < name.split(" ").length - 1; i++) {
        firstname = firstname.union({name.split(" ")[i]});
      }
      return firstname.join(" ");
    }
    final lastname = name.split(" ").last;
    final firstname = createFirstname();
    try {
      final response = await _api.post(Endpoints.register, {
        "lastname": lastname,
        "firstname": firstname,
        "email": email,
        "password": password,
        "phone": phone,
        "notification_token": ntoken
      });
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> login(String identifier, String password) async {
    Map<String, dynamic> data = {
      "identifier": identifier,
      "password": password,
    };

    try {
      final response = await _api.post(Endpoints.login, data);
      return AuthResponse.fromJson(response.data);
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
