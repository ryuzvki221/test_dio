import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unicorn_response.g.dart';

@JsonSerializable()
class UnicornResponse  extends Equatable{
  final String? sId;
  final String? name;
  final int? age;
  final String? colour;

  const UnicornResponse({ this.sId, this.name, this.age,  this.colour});

  factory UnicornResponse.fromJson(Map<String, dynamic> json) =>
      _$UnicornResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnicornResponseToJson(this);

  @override
  List<Object?> get props => [sId, name, age, colour];

}
