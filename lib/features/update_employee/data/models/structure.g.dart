// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Structure _$StructureFromJson(Map<String, dynamic> json) => Structure(
      mainStructure: (json['main_structure'] as List<dynamic>?)
          ?.map((e) => MainStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
      subStructure: (json['sub_structure'] as List<dynamic>?)
          ?.map((e) => SubStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StructureToJson(Structure instance) => <String, dynamic>{
      'main_structure': instance.mainStructure,
      'sub_structure': instance.subStructure,
    };

MainStructure _$MainStructureFromJson(Map<String, dynamic> json) =>
    MainStructure(
      structureId: json['structure_id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$MainStructureToJson(MainStructure instance) =>
    <String, dynamic>{
      'structure_id': instance.structureId,
      'title': instance.title,
    };

SubStructure _$SubStructureFromJson(Map<String, dynamic> json) => SubStructure(
      departmentId: json['department_id'] as String,
      structureId: json['structure_id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SubStructureToJson(SubStructure instance) =>
    <String, dynamic>{
      'department_id': instance.departmentId,
      'structure_id': instance.structureId,
      'title': instance.title,
    };
