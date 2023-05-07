// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unicorn_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnicornResponse _$UnicornResponseFromJson(Map<String, dynamic> json) =>
    UnicornResponse(
      sId: json['_id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      colour: json['colour'] as String,
    );

Map<String, dynamic> _$UnicornResponseToJson(UnicornResponse instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'name': instance.name,
      'age': instance.age,
      'colour': instance.colour,
    };
