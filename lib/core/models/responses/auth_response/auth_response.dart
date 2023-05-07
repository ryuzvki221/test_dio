import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse extends Equatable {
  final String message;
  final Data data;

  const AuthResponse({
    required this.message,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  @override
  List<Object?> get props => [message, data];
}

@JsonSerializable()
class Data extends Equatable {
  final User user;
  final String accessToken;

  const Data({required this.accessToken, required this.user});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props => [accessToken, user];
}

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.name,
    required this.phone,
    required this.role,
    required this.notificationToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  final String name;
  final String phone;
  final String role;
  final String notificationToken;

  @override
  List<Object?> get props => [name, phone, role, notificationToken];
}
