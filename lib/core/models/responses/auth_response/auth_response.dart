import 'dart:convert';

AuthResponse authFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  final String? avatar;
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? role;
  final String? notificationToken;
  final String? state;
  final String? accessToken;
  final String? message;

  AuthResponse({
    this.avatar,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.role,
    this.notificationToken,
    this.state,
    this.accessToken,
    this.message,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    message: json["message"],
    avatar: json["avatar"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    notificationToken: json["notification_token"],
    state: json["state"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "avatar": avatar,
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "role": role,
    "notification_token": notificationToken,
    "state": state,
    "accessToken": accessToken,
  };
}
