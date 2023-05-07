import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class YonimaSecureStorage {
  final secureStorage = const FlutterSecureStorage();

  Future<void> persistenToken(String token) async {
    await secureStorage.write(key: 'access_token', value: token);
  }

  Future<void> persistenRole(String role) async {
    await secureStorage.write(key: 'role', value: role);
  }

  Future<String?> readRole() async {
    return await secureStorage.read(key: 'role');
  }

  Future<String?> readToken() async {
    return await secureStorage.read(key: 'access_token');
  }

  Future<void> deleteSecureStorage() async {
    await secureStorage.delete(key: 'access_token');
    await secureStorage.deleteAll();
  }
}

final secureStorage = YonimaSecureStorage();
