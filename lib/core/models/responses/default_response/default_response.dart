import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable()
class DefaultResponse extends Equatable {
  final String? message;

  const DefaultResponse({
    required this.message});

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);

  @override
  List<Object?> get props => [message];
}


